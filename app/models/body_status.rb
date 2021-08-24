class BodyStatus < ApplicationRecord
  belongs_to :user
  def start_time
    self.record_at
  end
end
