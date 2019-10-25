class CreateWarehouseCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :warehouse_carts do |t|
      t.integer :cart_id
      t.integer :warehouse_id
      t.integer :quantity
      t.timestamps
    end
  end
end
