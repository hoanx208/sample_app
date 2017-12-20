class User < ApplicationRecord
  before_save {self.email = email.downcase}
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
    length: {maximum: Settings.user.email.max_length},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :name, presence: true,
    length: {maximum: Settings.user.name.max_length}
  validates :password, presence: true,
    length: {minimum: Settings.user.password.min_length}
end
