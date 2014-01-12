class RemoteOrderIdFromOrderAndAddOrderIdToItem < ActiveRecord::Migration
  def change
    remove_column :orders, :order_id
    add_column :items, :order_id, :integer
  end
end
