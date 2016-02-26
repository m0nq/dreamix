class FavoritesController < ApplicationController
  def create
    member = Member.find_by_id(session[:id])
    favorite = member.favorites.where({song_id: params[:id], member_id: session[:id]})
    # if already favorited, i.e. linked together in the db, then unlink them.
    unless favorite.nil?.delete
      flash[:notice] = "Taken off your favorites. #re'spect... {(_ _)}"

    # else, link them, thus adding to your favorites.
    flash[:notice] = "Added to your favorites!"
    fav = Favorite.create(:member_id => session[:member_id])
    fav.
    redirect_to :controller => "songs", :action => "show", :id => session[:member_id]
  end
end
