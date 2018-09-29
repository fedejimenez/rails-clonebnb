class ChangeTypeForPhotos < ActiveRecord::Migration[5.2]
  def change
  	change_column :listings, :photos, :string
  	rename_column :listings, :photos, :photo
  end
end
