class Customer < ActiveRecord::Base
  has_many :projects

  validates :business_name, presence: true, uniqueness: true
  validates :phone, presence: true
end
