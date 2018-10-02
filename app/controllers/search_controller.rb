class SearchController < ApplicationController
 include SearchHelper
  
  def index
  	puts "search controller"
    @results = PgSearch.multisearch(params[:search])
  end
  
  def search
  	puts "search"

    @results = Listing.search_cities(params["query"])
    puts "results"
    puts @results
    render json: @results    
  end
  
end
