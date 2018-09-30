class AddColumnDatesToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :dates, :string, array: true, default: []
  end
end
