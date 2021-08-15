class Menu < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :menu_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  def self.search(keyword)
    where(["menu_name like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
  end
end
