class ReservationMailer < ApplicationMailer
  
  default from: "ijuinairbnb@gmail.com"

  def customer_booking_email(customer, booking_confirmation)
    @customer = customer
    @booking = ActsAsBookableBooking.find_by(confirmation_number: booking_confirmation)
    @listing = Listing.find(@booking.bookable_id)
    mail(to: "ijuinairbnb@gmail.com", subject: "You're going to #{@listing.city}")
  end
  
end