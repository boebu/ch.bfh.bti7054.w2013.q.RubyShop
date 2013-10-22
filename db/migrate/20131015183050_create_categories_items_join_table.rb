class CreateCategoriesItemsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :categories, :items do |t|
      # t.index [:category_id, :item_id]
      # t.index [:item_id, :category_id]
      t.integer :category_id
      t.integer :item_id
    end
  end
end
