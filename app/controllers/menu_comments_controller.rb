class MenuCommentsController < ApplicationController
  #コメントコントローラー
  def create
    menu = Menu.find(params[:menu_id])
    comment = current_user.menu_comments.new(menu_comment_params)
    comment.menu_id = menu.id
    comment.save
    redirect_to menu_path(menu)
  end

  def destroy
    MenuComment.find_by(id: params[:id], menu_id: params[:menu_id]).destroy
    redirect_to menu_path(params[:menu_id])
  end
  
  private

  def menu_comment_params
    params.require(:menu_comment).permit(:comment)
  end
end
