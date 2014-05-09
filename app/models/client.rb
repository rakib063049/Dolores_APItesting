class Client < ActiveRecord::Base
  has_many :users

  validates :business_name, presence: true, uniqueness: true
  validates :phone, presence: true
end
