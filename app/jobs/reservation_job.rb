class ReservationJob < ActiveJob::Base
  queue_as :default

  def perform(user, confirmation_number)
    ReservationMailer.customer_booking_email(user, confirmation_number).deliver_later
  end
  
end