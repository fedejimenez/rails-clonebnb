json.extract! listing_image, :id, :listing_id, :avatar, :created_at, :updated_at
json.url listing_image_url(listing_image, format: :json)