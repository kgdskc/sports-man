class BodyStatusesController < ApplicationController
  def index
    @body_statuses = BodyStatus.all
    @body_status = current_user
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
    @body_statuses = BodyStatus.all
  end
  
  def calender_show　#カレンダー日付一覧ページ表示
  end
  
  private
  def body_status_params
    params.require(:body_status).permit(:user_id, :weight, :ingestion_cal, :consumed_cal, :record_at)
  end
end
