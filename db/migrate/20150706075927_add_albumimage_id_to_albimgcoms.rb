class AddAlbumimageIdToAlbimgcoms < ActiveRecord::Migration
  def change
    add_column :albimgcoms, :albumimage_id, :integer
  end
end
