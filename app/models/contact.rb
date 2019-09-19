class Contact < ApplicationRecord
  belongs_to :user
  has_many :group_contacts
  has_many :groups, through: :group_contacts

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, with: /\A(\w|[.])+[@]\w{3,}[.]\w{2,13}\z/

  def friendly_updated_at
    updated_at.strftime("%A, %b %d")
  end

  def full_name
    result = "#{first_name} "
    result += "#{middle_name} " if middle_name
    result += "#{last_name}"
  end

  def japan_number
    "+81 #{phone_number}"
  end
end
