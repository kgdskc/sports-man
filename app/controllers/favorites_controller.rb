class FavoritesController < ApplicationController
  #いいねコントローラー
  def create
    @menu = Menu.find(params[:menu_id])
    favorite = current_user.favorites.new(menu_id: @menu.id)
    favorite.save
  end

  def destroy
    @menu = Menu.find(params[:menu_id])
    favorite = current_user.favorites.find_by(menu_id: @menu.id)
    favorite.destroy
  end
end
