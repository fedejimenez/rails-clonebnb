class ListingImage < ActiveRecord::Base
  # mount_uploader :image, PhotoUploader
  belongs_to :listing
end