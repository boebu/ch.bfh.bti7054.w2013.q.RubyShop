class CreateItemTranslations < ActiveRecord::Migration
  def change
    create_table :item_translations do |t|
      t.string :title
      t.text :description
      t.belongs_to :item
      t.belongs_to :language

      t.timestamps
    end
  end
end
