class FixColumnNameListings < ActiveRecord::Migration[5.2]
  def change
  	remove_column :listings, :number
    rename_column :listings, :guest, :guest_number
  end
end
