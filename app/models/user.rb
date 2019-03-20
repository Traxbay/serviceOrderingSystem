class User < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save{ email.downcase!}


  validates :firstName, presence: true, length: {maximum: 50}
  validates :lastName, presence: true, length: {maximum: 50}
  validates :username, presence: true, length: {maximum: 50}, uniqueness: {case_sensitive: false}
  validates :email, presence: true, length: {maximum: 255}, uniqueness: {case_sensitive: false}, format: {with: VALID_EMAIL_REGEX}

  has_secure_password
  validates :password, presence: true, length: {minimum: 6}

end
