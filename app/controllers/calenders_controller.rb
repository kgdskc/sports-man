class CalendersController < ApplicationController
  def index #カレンダー一覧ページ表示
    @body_statuses = BodyStatus.all
  end

  def show #カレンダー日付一覧ページ表示
  end

  private
end
