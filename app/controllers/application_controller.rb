class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  helper_method :current_user, :logged_in? 

  def current_user 
    @current_user ||= User.find_by(id: session[:user_id]) if session [:user_id] 
  end

  def logged_in? 
    current_user.present? 
  end

  def require_login 
    redirec_to login_path, alert: "Please log in first!" unless logged_in? 
  end
end
