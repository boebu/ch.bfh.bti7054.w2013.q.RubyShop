class AddOrderIdtoOrder < ActiveRecord::Migration
  def change
    add_column :orders, :order_id, :integer
  end
end
