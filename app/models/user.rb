class User < ApplicationRecord

  has_secure_password

  validates_uniqueness_of :email
  validates_presence_of :first_name, :last_name, :email
  validates :password, length: {within: 6..40}

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.downcase.strip)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
