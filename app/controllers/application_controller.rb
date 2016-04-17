class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def confirmed_logged_in
    unless session[:member_id]
      flash[:notice] = "Please log in."
      redirect_to(controller: 'access', action: 'login')
      return false # halts the before_action
    else
      return true
    end
  end

  def current_user
    @current_user ||= Member.find(session[:member_id]) if session[:member_id]
  end
  helper_method :current_user
end
