class PagesController < ApplicationController
  # before_action :require_login, only: [:index] # index: page I want to protect
	before_action :require_user, :only => [:index, :search]

	def index
	    @users = User.all
	end

	# def search
	# 	search_attr = params[:search]
	# 	@listings = Listing.get_listings_for_search_attr search_attr, current_user
	# end
  
end
