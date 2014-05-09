class Customer < ActiveRecord::Base
  validates :business_name, presence: true
end
