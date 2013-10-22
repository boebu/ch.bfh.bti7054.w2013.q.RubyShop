class CreateItemTranslations < ActiveRecord::Migration
  def change
    create_table :item_translations do |t|
      t.string :language
      t.string :title
      t.text :description
      t.belongs_to :item

      t.timestamps
    end
  end
end
