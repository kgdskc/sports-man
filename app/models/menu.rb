class Menu < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :menu_comments, dependent: :destroy
end
