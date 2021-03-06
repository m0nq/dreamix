class SoundcloudController < ApplicationController
  def connect
    # create client object wiht app credentials
    client = Soundcloud.new(:client_id => ENV["SOUNDCLOUD_CLIENT_ID"], :client_secret => ENV["SOUNDCLOUD_CLIENT_SECRET"], :redirect_uri => "http://localhost:3000/soundcloud/oath-callback", :response_type => 'code')

    # redirect user to authorize url
    redirect_to client.authorize_url(:grant_type => 'authorization_code', :scope => 'non-expiring', :display => 'popup')
  end

  def connected
    # create client object with app credentials
    client = Soundcloud.new(:client_id => ENV["SOUNDCLOUD_CLIENT_ID"], :client_secret => ENV["SOUNDCLOUD_CLIENT_SECRET"], :redirect_uri => "http://localhost:3000/soundcloud/oath-callback")
    # exchange authorization code for access token
    access_token = client.exchange_token(:code => params[:code])
    client = Soundcloud.new(:access_token => access_token["access_token"])
    # make an authenticated call
    soundcloud_user = client.get('/me')
    unless Member.where(:soundlcoud_user_id => soundcloud_user["id"]).present?
      Member.create_from_soundcloud(soundcloud_user, access_token)
    end
    sign_in_user = Member.where(:soudncloud_user_id => soundcloud_user["id"])
    # create user sessions
    session[:member_id] = sign_in_user.first.id
    redirect_to root_url, notice: "Signed in!"
  end

  def destroy
  end
end
