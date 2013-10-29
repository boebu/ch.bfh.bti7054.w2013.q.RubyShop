class ItemTranslation < ActiveRecord::Base
  belongs_to :item
  has_one :language
end
