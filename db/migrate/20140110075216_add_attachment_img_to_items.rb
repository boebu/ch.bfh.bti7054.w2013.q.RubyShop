class AddAttachmentImgToItems < ActiveRecord::Migration
  def self.up
    change_table :items do |t|
      t.attachment :imgSrc
    end
  end

  def self.down
    drop_attached_file :items, :imgSrc
  end
end
