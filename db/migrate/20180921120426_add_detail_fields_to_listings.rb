class AddDetailFieldsToListings < ActiveRecord::Migration[5.2]
  def change
  	add_column :listings, :availability_from, :date
    add_column :listings, :availability_to, :date
    add_column :listings, :notice_period, :integer, :null=>false, :default=>5
    add_column :listings, :maximum_guests, :integer, :null=>false, :default=>1
  end
end
