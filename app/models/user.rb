class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ニックネームは必須
  validates :nickname,          presence: true

  # お名前は（全角）
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角（漢字・ひらがな・カタカナ）で入力してください" } do
    validates :last_name
    validates :first_name
  end

  # お名前のカナは「全角のカタカナ」
  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "は全角（カタカナ）で入力してください" } do
    validates :last_name_kana
    validates :first_name_kana
  end

  # パスワードは「半角英数字混合」
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: "は半角英数字混合で入力してください"

  # 生年月日は必須
  validates :date_birth,        presence: true
end
