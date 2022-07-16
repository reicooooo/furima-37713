class PurchasesDestinations
  include ActiveModel::Model
  attr_accessor :post_code,:shipping_id,:city,:address,:building_name,:phone_number, :user_id, :product_id, :purchase_id, :token

  
  with_options presence: true do
  
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A\d[0-9]{10,11}\z/}
    validates :shipping_id, numericality: {other_than: 1 , message: "can't be blank"}
    validates :city
    validates :address
    validates :token
    validates :product_id

  end

    def save
      purchase = Purchase.create(user_id: user_id, product_id: product_id)
      Destination.create(post_code: post_code, shipping_id: shipping_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
    end

end