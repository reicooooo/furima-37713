class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user 
  belongs_to :category
  belongs_to :condition
  belongs_to :sipping
  belongs_to :sipping_day
  belongs_to :sipping_postage

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

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :sipping_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :sipping_postage_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :sipping_day_id, numericality: { other_than: 1 , message: "can't be blank"}
end

