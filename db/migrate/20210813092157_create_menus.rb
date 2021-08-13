class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.integer :user_id, null: false
      t.string :image_id, null: false
      t.text :body, null: false
      t.integer :estimation_ingestion_cal, null: false, default: "0"
      t.string :menu_name, null: false

      t.timestamps
    end
  end
end
