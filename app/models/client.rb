class Client < ActiveRecord::Base
  has_and_belongs_to_many :users
  #accepts_nested_attributes_for :users, allow_destroy: true


  validates :business_name, presence: true, uniqueness: true
  validates :phone, presence: true
end
