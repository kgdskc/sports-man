class BodyStatusesController < ApplicationController
  def index
    @body_status = current_member 
  end
  
  def create
  end
  
  def new
  end
  
  def edit
  end
  
  def update
  end
  
  def calender_index　#カレンダー一覧ページ表示
  end
  
  def calender_show　#カレンダー日付一覧ページ表示
  end
end
