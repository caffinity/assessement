class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :classroom

  validates :email, format: { with: /@pentlandfields.com/i,
message: "You must register for this site with an @pentlandfields.com email address" }
end
