class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  #Signifies that this method is also a helper method
  #Application methods works in every Controllers, but not in Views
  #Helper methods work in every Views file, but not in Controllers
  helper_method :current_user, :logged_in?

  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
      !!current_user
  end
end
