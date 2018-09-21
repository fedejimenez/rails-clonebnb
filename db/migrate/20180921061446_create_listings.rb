class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :user_id, null: false
      t.string :name, null: false
      t.integer :place_type, null: false 
      t.string :property_type, null: false
      t.integer :room_number, null: false
      t.integer :bed_number, null: false
      t.string :guest_number, null: false
      t.string :country, null: false
      t.string :state, null: false
      t.string :city, null: false
      t.string :zipcode, null: false
      t.string :address, null: false
      t.integer :price, null: false
      t.string :description

      t.timestamps null: false
    end
  end
end
