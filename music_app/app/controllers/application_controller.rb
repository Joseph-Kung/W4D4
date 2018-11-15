class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?

  def login(user)
    session[:session_token] = user.reset_session_token!
  end

  def logged_in?
    return true if current_user
    false
  end

  def current_user
    return nil unless session[:session_token]
    User.find_by(session_token: session[:session_token])
  end

  def log_out!
    current_user.reset_session_token!
    session[:session_token] = nil
  end
end
