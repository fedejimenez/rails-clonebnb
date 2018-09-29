module SearchHelper
  def search(terms)
    search = params[:search_form].split(" ")
    @search_terms = []
    search.each do |search_term|
      # This removes proper grammar (e.g. you're => your), fix this in later version
      @search_terms << search_term.gsub(/[^a-zA-Z0-9\-]/,"")
    end
    
    city_results = []
    country_results = []
    exact_match = []
    city_match = []
    results = Hash.new
    
    @search_terms.each do |search_term|
      city_results = Listing.where("city ILIKE ?", "%#{search_term}%") + city_results
      country_results = Listing.where("country ILIKE ?", "%#{search_term}%") + country_results
      results_list = city_results & country_results
      
      results_list.each do |result|
        exact_match << result
        results[:exact_match] = exact_match
      end
      
      city_results.each do |result| # expand this to nearby cities in the future
        city_match << result
        results[:partial_match] = city_match
      end
      
    end
    results
  end
end
