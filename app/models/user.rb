class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many:products 
         has_many:purchases

         vallidates :nickname, presence: true
         vallidates :family_name, presence: true
         vallidates :first_name, presence: true
         vallidates :family_name_kana, presence: true
         vallidates :first_name_kana, presence: true
         vallidates :birthday, presence: true
end
