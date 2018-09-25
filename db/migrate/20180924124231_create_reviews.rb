class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
	    t.integer "rating"
	    t.string  "text"
	    t.integer "user_id"
	    t.integer "listing_id"
    end
  end
end
