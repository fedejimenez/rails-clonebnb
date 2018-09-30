class Booking < ActiveRecord::Base
	belongs_to :user
	belongs_to :listings

	# validate :start_date, presence:true
	# validate :end_date, presence:true

	# validate :check_dates
	# validate :check_before_today
	# validate :check_overlap

	# before_create :compute_total_price

	# def compute_total_price
	#  byebug
	#  lsiting_price = Listing.find(self.listing_id).price
	#  self.total_price = (self.end_date - self.start_date) * listing_price
	# end

	# def check_dates
	# 		# consider todays date (cant be before
	# 		if self.start_date > self.end_date
	# 			error.add(:check_dates_error, "The start nust be before ending date")
	# 		end
	# end

	# def check_overlap
	# 	 # find all the reservations for current listing
	# 	 # check against the new reservation
	# 	 # if there are overlap --> error
	# 	 # metod overlap 
	# end

end