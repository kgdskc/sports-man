class MenusController < ApplicationController
  def index
    @menus = Menu.all
  end

  def new
    @menu = Menu.new
  end

  def show
    @menu = Menu.find(params[:id])
    @menu_comment = MenuComment.new
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.user_id = current_user.id
    @menu.save
    redirect_to menus_path
  end

  def update
    @menu = Menu.find(params[:id])
    @menu.update(menu_params)
    redirect_to menus_path
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to menus_path
  end

  private

  def menu_params
    params.require(:menu).permit(:user_id, :image, :body, :estimation_ingestion_cal, :menu_name)
  end
end
