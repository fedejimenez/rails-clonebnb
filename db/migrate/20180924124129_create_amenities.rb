class CreateAmenities < ActiveRecord::Migration[5.2]
  def change
    create_table :amenities do |t|
	    t.boolean "breakfast"
	    t.boolean "wifi"
	    t.boolean "tv"
	    t.boolean "shampoo"
	    t.boolean "elevator"
	    t.boolean "iron"
	    t.boolean "pool"
	    t.boolean "gym"
	    t.boolean "fire_extinguisher"
	    t.boolean "carbon_monoxide_detector"
	    t.boolean "smoke_detector"
	    t.integer "listing_id"
    end
  end
end
