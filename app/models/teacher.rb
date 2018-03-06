class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :classroom

  APPROVED_DOMAINS = ["lgflmail.org", "pentlandfieldschool.co.uk", "theedenacademy.co.uk"]

  validates :email, presence: true, if: :domain_check

  def domain_check
    unless APPROVED_DOMAINS.any? { |word| email.end_with?(word) }
      errors.add(:email, ": You must register for this site with an authorised email domain. For more information please see your administrator")
    end
  end

end
