class User < ActiveRecord::Base
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :user_name, :password_digest, :email, presence: true
	validates :email, uniqueness: { case_sensitive: false }, format: {with: VALID_EMAIL_REGEX}
    #validates :password_digest, length: { in: 6..20 }
    has_secure_password

    has_many :portfolios
    has_many :watchlists
    has_many :stocks, through: :portfolios
    has_many :stocks, through: :watchlists
end


