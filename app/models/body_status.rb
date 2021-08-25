class BodyStatus < ApplicationRecord
  belongs_to :user
  
  validates :weight, numericality: true
  validates :ingestion_cal, numericality: true
  validates :consumed_cal, numericality: true
  
  def start_time
    self.record_at
  end
end
