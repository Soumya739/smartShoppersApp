class CreateWarehouseOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :warehouse_orders do |t|
      t.integer :order_id
      t.integer :warehouse_id
      t.integer :quantity
      t.timestamps
    end
  end
end
