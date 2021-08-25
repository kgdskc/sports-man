class UsersController < ApplicationController
  before_action :set_user, only: [:likes]
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  # ↓いいねした投稿を表示するためのアクション
  def likes
    likes = Favorite.where(user_id: @user.id).pluck(:menu_id)
    @like_menus = Menu.find(likes)
    @likes = Kaminari.paginate_array(likes).page(params[:page])
  end

  private

  # ↓likesを読む前にbefore_actionで読まれます。
  def set_user
    @user = User.find(params[:user_id])
  end

  def user_params
    params.require(:user).permit(:name, :birthdate, :phone_number)
  end
end
