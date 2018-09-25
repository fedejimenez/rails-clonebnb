class AddColumnsToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :bathrooms, :integer
    add_column :listings, :photos, :json
    add_column :listings, :rating, :integer, :default => 0
    add_column :listings, :schedule, :text
  end
end
