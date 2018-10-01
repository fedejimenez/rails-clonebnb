class ReservationMailer < ApplicationMailer
  
  default from: "fjclonebnb@gmail.com"

  # def customer_booking_email(customer, booking_confirmation)
    # @customer = customer
  def customer_booking_email(booking_confirmation)
    @booking = Booking.find_by(confirmation_number: booking_confirmation)
    @listing = Listing.find(@booking.listing_id)
    mail(to: "fjclonebnb@gmail.com", subject: "You're going to #{@listing.city}")
  end
  
end