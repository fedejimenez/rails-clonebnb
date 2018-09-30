class RenameActsAsBookableBookingsToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :acts_as_bookable_bookings, :confirmation_number, :string
  	rename_table :acts_as_bookable_bookings, :bookings
  end
end
