module ListingImagesHelper
	def current_listing_image
	    ListingImages.find(params[:id])
  	end
end
