class CategoryTranslation < ActiveRecord::Base

  belongs_to :category
  has_one :language

end
