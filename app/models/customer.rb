class Customer < ActiveRecord::Base
  has_many :projects
  belongs_to :user, foreign_key: :created_by

  validates :business_name, presence: true, uniqueness: true
  validates :phone, presence: true
end
