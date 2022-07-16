class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string     :post_code,   null: false
      t.integer    :shipping_id,    null: false
      t.string     :city
      t.string     :address
      t.string     :building_name
      t.string     :phone_number,    null: false
      t.references :purchase,      null: false, foreign_key: true

      t.timestamps
    end
  end
end
