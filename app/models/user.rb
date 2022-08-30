class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name_full, presence: true
  validates :first_name_full, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true
  
  # パスワード半角に英数字の必須を指定した
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  # /パスワード半角に英数字の必須を指定した

  # 名前に全角(漢字、ひらがな、カタカナ)の必須を指定した
  ZENKAKU_FULL = /\A[ぁ-んァ-ン一-龥]/
  validates :last_name_full, format: { with: ZENKAKU_FULL }
  validates :first_name_full, format: { with: ZENKAKU_FULL }
  # /名前に全角(漢字、ひらがな、カタカナ)の必須を指定した

  # 名前(カナ)に全角(カタカナ)の必須を指定した
  ZENKAKU_KANA = /\A[ァ-ヶー－]+\z/
  validates :last_name_kana, format: { with: ZENKAKU_FULL }
  validates :first_name_kana, format: { with: ZENKAKU_FULL }
  # /名前(カナ)に全角(カタカナ)の必須を指定した

end
