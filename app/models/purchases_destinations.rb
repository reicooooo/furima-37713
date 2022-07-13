class PurchasesDestinations
  include ActiveModel::Model
  attr_accessor :post_code,:shipping_id,:city,:address,:building_name,:phone_number,:purchase_id,:user_id,:product_id, :price

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 1000000, message: 'is invalid'}
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\d{10,11}/}
    validates :shipping_id, numericality: {other_than: 0, message: "can't be blank"}
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    def save
      # 寄付情報を保存し、変数donationに代入する
      purchase = Purchase.create(price: price, user_id: user_id)
      # 住所を保存する
      # donation_idには、変数donationのidと指定する
      Destination.create(post_code: post_code, shippind_id: shipping_id, city: city, address: address, building_name: building_name, purchase_id: purchase.id)
    end



  end
end