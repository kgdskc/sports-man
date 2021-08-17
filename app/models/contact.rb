class Contact < ApplicationRecord
  enum subject: {'質問': 0, '不具合・バグ': 1, 'ご意見・ご要望': 2, 'その他': 3}
end
