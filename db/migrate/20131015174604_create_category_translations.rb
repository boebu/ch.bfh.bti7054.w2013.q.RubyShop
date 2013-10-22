class CreateCategoryTranslations < ActiveRecord::Migration
  def change
    create_table :category_translations do |t|
      t.string :language
      t.string :name
      t.belongs_to :category

      t.timestamps
    end
  end
end
