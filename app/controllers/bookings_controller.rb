class BookingsController < ApplicationController
  # include ApplicationHelper
  
  before_action :require_permission, except: [:dates_confirmation]
  
  def payment_details
    @client_token = Braintree::ClientToken.generate
  end
  
  def checkout
    nonce_from_the_client = params[:checkout_form][:payment_method_nonce]
    result = Braintree::Transaction.sale(
      :amount => current_listing.total_price(session[:start_date], session[:end_date]), 
      :payment_method_nonce => nonce_from_the_client,
      :options => {
        :submit_for_settlement => true
      }
    )
    if result.success?
      redirect_to book_confirmation_path(params[:id]), :flash => { :notice => "Payment successful" }
    else
      redirect_to payment_details_path, :flash => { :error => "Payment failed. Please try again." }
    end
  end
  
  def dates_confirmation
    # if current_listing.is_available?(params[:start_date],params[:end_date])
      session[:start_date] = params[:start_date]
      session[:end_date] = params[:end_date]
    # else
    #   flash[:booking_error] = "Sorry - some of your dates weren't available."
    #   redirect_to listing_path
    # end 
  end
  
  def book_finalization
    if current_user.book! current_listing, time_start: session[:end_date].to_date, time_end: session[:end_date].to_date
      current_listing.reserve_dates(session[:start_date],session[:end_date])
      @booking = current_user.bookings.last
      @booking.confirmation_number = SecureRandom.hex(5)
      
        if @booking.save
          ReservationJob.perform_later(current_user, @booking.confirmation_number)
          flash[:notice] = "Booking confirmed!"
        else
          flash[:notice] = "Looks like something went wrong, try again in a few minutes."
          redirect_to dates_confirmation_path(current_listing.id)
        end
    end
  end

  private
  
  def require_permission
    if !signed_in?
      flash[:notice] = "Log in to book!"
    end
  end
  
end