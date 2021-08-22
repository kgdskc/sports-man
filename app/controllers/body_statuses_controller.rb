class BodyStatusesController < ApplicationController

  def index
    @user = current_user
    @body_status = BodyStatus.where(user_id: current_user.id).order(record_at: :desc).first
  end

  def create
    @body_status = BodyStatus.new(body_status_params)
    @body_status.user_id = current_user.id
    @body_status.save
    redirect_to body_statuses_path
  end

  def new
    @body_status = BodyStatus.new
  end

  def edit
  end

  def update
  end

  private
  def body_status_params
    params.require(:body_status).permit(:user_id, :weight, :ingestion_cal, :consumed_cal, :record_at)
  end
end
