module ApplicationHelper
	def current_user_is_listing_owner?(listing)
		current_user.id == listing.user_id
	end
end
