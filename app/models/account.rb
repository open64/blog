class Account < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation

  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
            uniqueness: {case_sensitive: false}
  before_save { |account| account.email = email.downcase }
  before_save :create_remember_token

	private
		def create_remember_token
			self.remember_token = SecureRandom.urlsafe_base64
		end
end
