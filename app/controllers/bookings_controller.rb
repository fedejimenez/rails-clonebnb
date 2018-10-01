class BookingsController < ApplicationController
  # include ListingsnHelper
  include ApplicationHelper
  
  before_action :require_permission, except: [:dates_confirmation]
  

  def create
    @booking = Booking.new(booking_params)
    # @booking.user_id = current_user.id
    # @booking.listing_id = params[:listing_id]

    if @booking.save
      redirect_to root_url
    else
      redirect_back(fallback_location: root_url)
    end

    # total_price = 
  end

  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

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
    if current_listing.is_available?(params[:start_date],params[:end_date])
      session[:start_date] = params[:start_date]
      session[:end_date] = params[:end_date]
    else
      flash[:booking_error] = "Sorry - some of your dates weren't available."
      redirect_to listing_path
    end 
  end
  
  def book_finalization
    # if current_user.book! current_listing, time_start: session[:start_date].to_date, time_end: session[:end_date].to_date
      current_listing.reserve_dates(session[:start_date],session[:end_date])
      @booking = Booking.new(booking_params)
      @booking.time_start = session[:start_date]
      @booking.time_end = session[:end_date]
      @booking.user_id = current_user.id
      @booking.listing_id = current_listing.id
      @booking.amount = current_listing.total_price(session[:start_date],session[:end_date])
      # @booking.listing_id = params[:listing_id]
      # @booking = current_user.bookings.last
      @booking.confirmation_number = SecureRandom.hex(5)
      @booking.save(validate: false)
      
      # if @booking.save
        # ReservationJob.perform_later(current_user, @booking.confirmation_number)
        ReservationJob.perform_later(@booking.confirmation_number)
        flash[:notice] = "Booking confirmed!"
      # else
        # flash[:notice] = "Looks like something went wrong, try again in a few minutes."
        # redirect_to dates_confirmation_path(current_listing.id)
      # end
  end

  private
  
  def require_permission
    if !signed_in?
      flash[:notice] = "Log in to book!"
    end
  end

  def booking_params
    # params.require(:booking).permit(:time_start, :time_end, :user_id)
    params.permit(:time_start, :time_end, :user_id, :listing_id)
  end
  
end