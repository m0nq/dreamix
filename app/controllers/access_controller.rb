class AccessController < ApplicationController
  before_action :confirmed_logged_in, :except => [:login, :attempt_login, :logout]

  def index
    # display text and links
  end

  def login
    # display login form
  end

  def attempt_login
    if params[:email].present? && params[:password].present?
      found_user = Member.where(email: params[:email]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if authorized_user
      # mark user as logged in
      session[:member_id] = authorized_user.id
      session[:name] = authorized_user.name
      flash[:notice] = "You are now logged in."
      redirect_to({ controller: 'songs', action: 'show', id: authorized_user.id})
        # :id => session[:member_id]
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(action: 'login')
    end
  end

  def logout
    # TODO: empty current members queue in it's stream.
    # mark user as logged out
    session[:member_id] = nil
    session[:name] = nil
    flash[:notice] = "Logged out"
    redirect_to(action: 'login')
  end
end
