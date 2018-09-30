class ChangeColumnsToBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :booker_id
  	remove_column :bookings, :bookable_id

    add_column :bookings, :user_id, :integer
    add_column :bookings, :listing_id, :integer
  end
end
