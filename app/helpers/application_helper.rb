module ApplicationHelper
	def current_user_is_listing_owner?(listing)
		current_user.id == listing.user_id
	end

	def current_listing
	    Listing.find(params[:id])
  	end
end
