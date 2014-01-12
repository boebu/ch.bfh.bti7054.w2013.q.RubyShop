class AddAttributesToItemOrders < ActiveRecord::Migration
  def change
    add_column :item_orders, :item_id, :integer
    add_column :item_orders, :order_id, :integer
  end
end
