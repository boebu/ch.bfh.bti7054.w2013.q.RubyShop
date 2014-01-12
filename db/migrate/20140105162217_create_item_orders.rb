class CreateItemOrders < ActiveRecord::Migration
  def change
    create_table :item_orders do |t|

      t.timestamps
      t.integer :quantity
    end
  end
end
