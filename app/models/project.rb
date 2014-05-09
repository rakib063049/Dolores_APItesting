class Project < ActiveRecord::Base
  belongs_to :customer
  belongs_to :contact
  belongs_to :user, foreign_key: :created_by
  has_many :time_logs

  validates :name, presence: true
  validates :number, presence: true
  validates :customer_id, presence: true
  validates :contact_id, presence: true


  def time_logged
    time_logs.sum(:logged)
  end

  def self.uniq_number
    number = loop do
      token = rand(36**10).to_s(36)
      break token.upcase! unless Project.exists?(number: token)
    end
  end
end
