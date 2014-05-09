class Client < ActiveRecord::Base
  has_and_belongs_to_many :users

  validates :business_name, presence: true, uniqueness: true
  validates :phone, presence: true
end
