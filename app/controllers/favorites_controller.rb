class FavoritesController < ApplicationController
  def create
    member = Member.find_by_id(session[:member_id])
    favorite = member.favorites.where({song_id: params[:id], member_id: session[:member_id]})
    # if already favorited, i.e. linked together in the db, then unlink them.
    unless favorite.nil?
      flash[:notice] = "Taken off your favorites. #re'spect... {(_ _)}"
      redirect_to :controller => "songs", :action => "show", :id => session[:member_id]
    else
      # else, link them, thus adding to your favorites.
      flash[:notice] = "Added to your favorites!"
      Favorite.create(song_id: params[:id], member_id: session[:member_id])
      redirect_to :controller => "songs", :action => "show", :id => session[:member_id]
    end
  end
end
