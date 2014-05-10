class User < ActiveRecord::Base
  has_and_belongs_to_many :clients
  has_many :customers, foreign_key: :created_by
  has_many :contacts, foreign_key: :created_by
  has_many :projects, foreign_key: :created_by
  has_many :time_logs

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :client_id, presence: true


  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :admin

  before_create :set_authentication_token

  scope :with_role, lambda { |role| {:conditions => "roles_mask & #{2**ROLES.index(role.to_s)} > 0"} }

  ROLES = %w[admin create_customers create_contacts create_projects]
  ROLES_WITHOUT_ADMIN = %w[create_customers create_contacts create_projects]

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end

  def role?(role)
    roles.include? role.to_s
  end

  def admin?
    role?('admin')
  end

  def name
    [self.first_name, self.last_name].join(" ")
  end

  def password_required?
    return false if admin.present? && !new_record?
    true
  end

  def set_authentication_token
    self.authentication_token = loop do
      token = rand(36**15).to_s(36)
      break token unless User.exists?(authentication_token: token)
    end
  end

end

