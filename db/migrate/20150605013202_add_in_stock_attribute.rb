class AddInStockAttribute < ActiveRecord::Migration
  def change
    add_column :products, :in_stock, :boolean
  end
end
