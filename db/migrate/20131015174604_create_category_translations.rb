class CreateCategoryTranslations < ActiveRecord::Migration
  def change
    create_table :category_translations do |t|
      t.string :name
      t.belongs_to :category
      t.belongs_to :language

      t.timestamps
    end
  end
end
