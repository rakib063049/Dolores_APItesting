class Contact < ActiveRecord::Base
  has_many :projects
  belongs_to :user, foreign_key: :created_by

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :contact_method, presence: true
  validates :customer_id, presence: true

  def name
    [self.first_name, self.last_name].join(" ")
  end
end
