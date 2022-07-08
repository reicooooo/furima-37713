class Product < ApplicationRecord
  belongs_to :user 
  #has_one :purchase 
  has_one_attached :image 

  validates :name, presence: true
  validates :price,presence: true
  validates :description ,presence: true
  validates :condition_id,presence: true
  validates :sipping_postage_id,presence: true
  validates :sipping_day_id,presence: true
  validates :category_id,presence: true
  validates :sipping_id ,presence: true
  validates :user,presence: true
end

