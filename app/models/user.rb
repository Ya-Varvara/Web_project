class User < ApplicationRecord
  has_many :recipes

  has_secure_password

  validates :username, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :f_name, presence: true, length: { maximum: 30 }
  validates :s_name, presence: true, length: { maximum: 30 }
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :password, confirmation: true, length: { minimum: 3 }

end
