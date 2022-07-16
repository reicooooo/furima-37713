class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



         has_many:products 
         has_many:purchases

         validates :nickname, presence: true
        
         
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 


         validates :family_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "Full=width characters"}
         validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "Full=width characters"}
         validates :family_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
         validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
         validates :birthday, presence: true
end
