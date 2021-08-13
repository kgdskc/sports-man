class Menu < ApplicationRecord
  belongs_to :user
  attachment :image
end
