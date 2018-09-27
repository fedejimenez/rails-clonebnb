class CreateKeywordListings < ActiveRecord::Migration[5.2]
  def change
    create_table :keyword_listings do |t|
	  t.integer "keyword_id" , default: nil
	  t.integer "listing_id" , default: nil
      t.timestamps
    end
  end
end
