module ListingsHelper
	def get_property_types
		return ["House", "Entire Floor", "Condominium", "Villa", 
    			"Apartment", "Dorm", "Townhouse", "Castle", "Treehouse", 
    			"Igloo", "Yurt", "Cave", "Chalet", "Hut","Tent", "Other"]
	end

	def get_place_types
		return ["entire home", "private room", "shared room"]		
	end

	def current_listing
	    Listing.find(params[:id])
  	end
end
