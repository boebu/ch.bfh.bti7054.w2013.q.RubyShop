class Item < ActiveRecord::Base
  has_many :translations, :class_name => "ItemTranslation"
  has_and_belongs_to_many :categories
end
