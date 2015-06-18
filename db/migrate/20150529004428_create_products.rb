class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, :precision => 10, :scale => 2
      t.string :image
      t.string :description
      t.boolean :in_stock

      t.timestamps null: false
    end
  end
end
