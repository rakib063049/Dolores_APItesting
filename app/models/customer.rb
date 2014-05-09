class Customer < ActiveRecord::Base
  validates :business_name, presence: true
  validates :contact_id, presence: true
end
