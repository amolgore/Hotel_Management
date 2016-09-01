class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  before_filter :set_cache_buster

 # Set the after sign in path for user
  def after_sign_in_path_for(resource)
   user_dashboard_path
  end

  protected
  # Added the method so that user can not redirect to back to his dashboard if he logs out.
    def set_cache_buster
      response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
      response.headers["Pragma"] = "no-cache"
      response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
    end


end
