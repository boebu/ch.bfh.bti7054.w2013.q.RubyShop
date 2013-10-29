class RemoveLanguageFromCategoryTranslation < ActiveRecord::Migration
  def change
    remove_column :category_translations, :language, :string
  end
end
