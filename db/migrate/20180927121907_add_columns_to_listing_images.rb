class AddColumnsToListingImages < ActiveRecord::Migration[5.2]
  def change
    add_column :listing_images, :title, :string
    add_column :listing_images, :description, :string
  end
end
