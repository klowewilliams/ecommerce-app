class AddInStockAttribute < ActiveRecord::Migration
  def change
    add_column :products, :in_stock, :string
  end
end
