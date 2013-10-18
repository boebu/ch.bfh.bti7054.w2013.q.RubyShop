class Category < ActiveRecord::Base
  belongs_to :parent, :class_name => "Category"
  has_many :children, :foreign_key => "parent_id", :class_name => "Category"
  has_many :translations, :class_name => "CategoryTranslation", :dependent => :destroy
  has_and_belongs_to_many :items
  accepts_nested_attributes_for :translations, allow_destroy: true
end
