class User < ApplicationRecord
  include Clearance::User

  has_many :rooms
  has_many :reservations
  has_many :listings
  # has_secure_password

  before_save { |user| user.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :full_name, length: {maximum: 70}, presence: true
  validates :email, presence: true,
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
  validates :encrypted_password, presence: true, length: { minimum: 6 }


  has_many :authentications, dependent: :destroy
  # acts_as_booker # Give model permission to make bookings through Bookable gem
  # mount_uploader :avatar, AvatarUploader # Create uploader
  enum role: [:customer, :moderator, :superadmin]

  
  def self.create_with_auth_and_hash(authentication, auth_hash)
   user = self.create!(
     full_name: auth_hash["info"]["name"],
     email: auth_hash["info"]["email"],
     password: SecureRandom.hex(10)
   )
   user.authentications << authentication
   return user
  end

  # grab google to access google for user data
  def google_token
   x = self.authentications.find_by(provider: 'google_oauth2')
   return x.token unless x.nil?
  end

  # grab facebook to access facebook for user data
  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

  def password_optional?
    true
  end
end

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

