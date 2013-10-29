class AddNameToLanguageTable < ActiveRecord::Migration
  def change
    add_column :languages, :name, :string
  end
end
