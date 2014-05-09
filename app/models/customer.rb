class Customer < ActiveRecord::Base
  validates :business_name, presence: true, uniqueness: true
  validates :phone, presence: true
end
