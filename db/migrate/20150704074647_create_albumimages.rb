class CreateAlbumimages < ActiveRecord::Migration
  def change
    create_table :albumimages do |t|
    	t.integer :album_id, null: false
    	t.string :imgname, null: false
    	t.timestamps null: false
    end
  end
end
