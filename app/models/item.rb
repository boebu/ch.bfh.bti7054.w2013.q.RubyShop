class Item < ActiveRecord::Base
  has_many :translations, :class_name => "ItemTranslation"
  has_and_belongs_to_many :categories
  accepts_nested_attributes_for :translations, :categories
  has_many :item_orders
  has_many :orders, through: :item_orders

end
