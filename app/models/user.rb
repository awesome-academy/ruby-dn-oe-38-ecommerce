class User < ApplicationRecord
  enum role: {supper_admin: 1, admin: 2, customer: 3}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :name, presence: true, length: {maximum: Settings.maximum_user}
  validates :phone, presence: true, length: {maximum: Settings.maximum_phone}
  validates :address, presence: true
  validates :email, presence: true, length: {maximum: Settings.maximum_email},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.minimum_password}, allow_nil: true
  has_secure_password

  private

  def downcase_email
    email.downcase!
  end
end
