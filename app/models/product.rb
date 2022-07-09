class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user 
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping
  belongs_to :shipping_day
  belongs_to :shipping_postage

  #has_one :purchase 
  has_one_attached :image 

  validates :name, presence: true
  validates :price,presence: true
  validates :description ,presence: true
  validates :condition_id,presence: true
  validates :shipping_postage_id,presence: true
  validates :shipping_day_id,presence: true
  validates :category_id,presence: true
  validates :shipping_id ,presence: true
  validates :user,presence: true

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_postage_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"}
end

