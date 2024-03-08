class User < ApplicationRecord

  has_secure_password

  validates_uniqueness_of :email
  validates_presence_of :first_name, :last_name, :email
end
