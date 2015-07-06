class AddDescToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :desc, :text
  end
end
