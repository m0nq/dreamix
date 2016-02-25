class FavoritesController < ApplicationController
  def create
    flash[:notice] = "Added to your favorites!"
    Favorite.create(:song => Song.find_by_id(params[:id]), :member => self.id)
    redirect_to :controller => "songs", :action => "show"
  end
end
