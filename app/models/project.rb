class Project < ActiveRecord::Base
  validates :name, presence: true
  validates :number, presence: true
  validates :customer_id, presence: true
  validates :contact_id, presence: true


  def self.uniq_number
    number = loop do
      token = rand(36**10).to_s(36)
      break token.upcase! unless Project.exists?(number: token)
    end
  end
end
