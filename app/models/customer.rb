class Customer < ActiveRecord::Base
  has_many :contacts
  has_many :projects
  belongs_to :user, foreign_key: :created_by

  validates :business_name, presence: true, uniqueness: true
  validates :phone, presence: true
  validates :zip_code, numericality: true, :allow_blank => true

  attr_accessor :contact_ids

  after_save :associate_contacts


  private

  def associate_contacts
    contacts = Contact.where(id: contact_ids)
    contacts.each do |contact|
      contact.update_column(:customer_id, self.id)
    end
  end
end
