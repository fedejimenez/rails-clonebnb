class Keyword < ActiveRecord::Base
  has_many :keyword_listings
  has_many :listings, through: :keyword_listings
end