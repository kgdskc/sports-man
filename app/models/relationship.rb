class Relationship < ApplicationRecord
  # フォロー・フォロワー機能用
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
end
