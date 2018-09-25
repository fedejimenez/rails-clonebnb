class ApplicationController < ActionController::Base
  include Clearance::Controller
  include Clearance::Authentication
  protect_from_forgery

  # rescue_from ActiveRecord::RecordNotFound, with: :not_found

  
  def not_found
    render file: "#{Rails.root}/public/404", layout: true, status: :not_found
  end

  def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
  	end
  end
end

