class ReservationJob < ActiveJob::Base
  queue_as :default

  # def perform(user, confirmation_number)
    # ReservationMailer.customer_booking_email(user, confirmation_number).deliver_later
  def perform(confirmation_number)
    # ReservationMailer.customer_booking_email(confirmation_number).deliver_later
    ReservationMailer.customer_booking_email(confirmation_number).deliver_now
  end
  
end