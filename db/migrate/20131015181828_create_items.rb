class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.decimal :price
      t.string  :imgSrc
      t.timestamps
    end
  end
end
