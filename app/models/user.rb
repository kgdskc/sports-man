class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :body_statuses, dependent: :destroy
  has_many :menus, dependent: :destroy
  #↓コメントのアソシエーション
  has_many :menu_comments, dependent: :destroy
  #↓いいね機能のアソシエーション
  has_many :favorites, dependent: :destroy
  has_many :favorited_menus, through: :favorites, source: :menu
  
    #↓フォロワーFKの参照先
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  
    #↓フォローFKの参照先
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  
  validates :name, presence: true
  validates :birthdate, presence: true
  validates :phone_number, presence: true
  #フォロー・フォロワーコントローラーで使うメソッドを定義
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  def following?(user)
    followings.include?(user)
  end
end
