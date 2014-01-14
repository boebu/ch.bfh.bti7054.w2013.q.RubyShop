class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.belongs_to :user
      t.string :firstName
      t.string :lastName
      t.string :street
      t.string :zip
      t.string :place
      t.string :phone
      t.timestamps
    end
  end
end
