class CreateBodyStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :body_statuses do |t|
      t.integer :user_id, null: false
      t.integer :weight, null: true
      t.integer :ingestion_cal, null: true
      t.integer :consumed_cal, null: true
      t.date :record_at, null: false

      t.timestamps
    end
  end
end
