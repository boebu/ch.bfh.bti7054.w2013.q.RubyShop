class UserInfo < ActiveRecord::Base
  belongs_to :user
  validates :firstName,  presence: true
  validates :lastName,  presence: true
  validates :phone, numericality: { only_integer: true }
  validates :street,  presence: true
  validates :zip, numericality: { only_integer: true }
  validates :place,  presence: true
end
