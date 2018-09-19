class User < ApplicationRecord
  include Clearance::User

  validates :full_name, length: {maximum: 50}, presence: true

  has_many :rooms
  has_many :reservations

  # has_secure_password

  # before_save { |user| user.email = email.downcase }
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, presence: true,
  # format: { with: VALID_EMAIL_REGEX },
  # uniqueness: { case_sensitive: false }
  # validates :password, presence: true, length: { minimum: 6 }
  # validates :password_confirmation, presence: true

  # def self.from_omniauth(auth)
  #   user = User.where(email: auth.info.email).first
  #   if user
  #     return user
  #   else
  #     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #       user.full_name = auth.info.name
  #       user.provider = auth.provider
  #       user.uid = auth.uid
  #       user.email = auth.info.email
  #       user.image = auth.info.image
  #       user.password = Devise.friendly_token[0, 20]
  #     end
  #   end
  # end
end
