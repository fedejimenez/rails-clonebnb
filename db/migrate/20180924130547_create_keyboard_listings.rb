class CreateKeyboardListings < ActiveRecord::Migration[5.2]
  def change
    create_table :keyboard_listings do |t|
	    t.integer "keyword_id" , default: nil
	    t.integer "listing_id" , default: nil
    end
  end
end
