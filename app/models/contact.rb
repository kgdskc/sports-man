class Contact < ApplicationRecord
  enum subject: { '質問': 0, '不具合・バグ': 1, 'ご意見・ご要望': 2, 'その他': 3 }

  validates :name, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true
  validates :message, presence: true, length: { maximum: 200 }
end
