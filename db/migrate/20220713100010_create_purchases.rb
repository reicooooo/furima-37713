class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.integer    :product,   null: false, index: true
      t.references :user,    null: false, foreign_key: true

      t.timestamps
    end
  end
end
