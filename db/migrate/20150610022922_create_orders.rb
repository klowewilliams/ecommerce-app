class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.integer :product_id
      t.integer :user_id
      t.decimal :total_price, precision: 8, scale: 2
      t.decimal :tax
      t.decimal :subtotal

      t.timestamps null: false
    end
  end
end
