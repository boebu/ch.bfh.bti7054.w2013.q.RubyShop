class Category < ActiveRecord::Base
  belongs_to :parent, :class_name => "Category"
  has_many :children, :foreign_key => "parent_id", :class_name => "Category"
  has_many :translations, :class_name => "CategoryTranslation"
  has_and_belongs_to_many :items
end
