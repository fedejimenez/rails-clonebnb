class KeywordListing < ActiveRecord::Base
  belongs_to :keyword
  belongs_to :listing
end