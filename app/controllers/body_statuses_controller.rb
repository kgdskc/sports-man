class BodyStatusesController < ApplicationController
  
  def index
    # ↓4~16行目は先月、次月のチャートを表示するための記述
    if params[:month]
      @month = params[:month]
      ar = params[:month].split('-')
      pp ar
      date = Date.new(ar[0].to_i, ar[1].to_i, 1)
    else
      date = Date.new(Date.today.year, Date.today.month, Date.today.day)
    end
    pp date
    @month = date.strftime("%Y-%m")
    @next_month = date.next_month.strftime("%Y-%m")
    @last_month = date.last_month.strftime("%Y-%m")

    @user = current_user

    # ↓最新の日付(record_at)のレコードを取り出す
    @body_status = current_user.body_statuses.order(record_at: :desc).first
    @now = Date.today

    # ↓25~30行目はチャートのY軸を二種類用意するための記述
    ingestion_cal = current_user.body_statuses.where("record_at like ?", "#{@month}%").group(:record_at).sum(:ingestion_cal)
    consumed_cal = current_user.body_statuses.where("record_at like ?", "#{@month}%").group(:record_at).sum(:consumed_cal)
    @chart = [
      { name: '摂取カロリー', data: ingestion_cal },
      { name: '消費カロリー', data: consumed_cal },
    ]
    @weight = current_user.body_statuses.where("record_at like ?", "#{@month}%").pluck(:record_at, :weight)
  end

  def create
    @body_status = BodyStatus.new(body_status_params)
    @body_status.user_id = current_user.id
    if @body_status.save
      redirect_to body_statuses_path
    else
      render :new
    end
  end

  def show
    @body_status = BodyStatus.find(params[:id])
  end

  def new
    @body_status = BodyStatus.new
  end

  def edit
    @body_status = current_user.body_statuses.find(params[:id])
  end

  def update
    @body_status = BodyStatus.find(params[:id])
    if @body_status.update(body_status_params)
      redirect_to body_statuses_path
    else
      render :edit
    end
  end

  private

  def body_status_params
    params.require(:body_status).permit(:user_id, :weight, :ingestion_cal, :consumed_cal, :record_at)
  end
end
