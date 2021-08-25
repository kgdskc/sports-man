class CalendarsController < ApplicationController
  def index # カレンダー一覧ページ表示
    @calendars = Calendar.all
    @body_statuses = current_user.body_statuses
  end

  def show # カレンダー日付一覧ページ表示
    @calendar = Calendar.find(params[:id])
  end

  private

  def calendar_parameter
    params.require(:calendar).permit(:title, :content, :start_time)
  end
end
