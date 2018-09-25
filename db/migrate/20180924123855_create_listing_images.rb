class CreateListingImages < ActiveRecord::Migration[5.2]
  def change
    create_table :listing_images do |t|
	    t.integer  "listing_id"
	    t.string   "image"
	    t.datetime "created_at", null: false
	    t.datetime "updated_at", null: false
    end
  end
end
