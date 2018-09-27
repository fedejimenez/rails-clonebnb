module BookingsHelper
  def book(user, listing)
    user.book! listing, time_start: session[:start_date].to_date, time_end: session[:end_date].to_date
    listing.reserve_dates(session[:start_date], session[:end_date])
    @booking = user.bookings.last
    @booking.confirmation_number = SecureRandom.hex(6)
    session[:confirmation_number] = @booking.confirmation_number
    @booking.save
  end
end
