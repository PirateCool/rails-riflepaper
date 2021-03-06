class User < ActiveRecord::Base
  has_secure_password

  has_many :wishlists
  has_many :products, through: :wishlists

  # Validations
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}, unless: :skip_email_validation
  validates :password, presence: true, on: :create

  attr_accessor :skip_email_validation
end
