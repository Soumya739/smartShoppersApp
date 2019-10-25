class CreateWarehouses < ActiveRecord::Migration[6.0]
  def change
    create_table :warehouses do |t|
      t.integer :item_id
      t.integer :store_id
      t.float :price
      t.integer :quantity
      t.timestamps
    end
  end
end
