class Menu < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :menu_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  validates :image, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  validates :estimation_ingestion_cal, numericality: true
  validates :menu_name, presence: true
  # ↓いいね
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  # ↓検索
  def self.search(keyword)
    where(["menu_name like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
  end
end
