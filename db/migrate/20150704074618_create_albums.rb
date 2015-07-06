class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
    	t.integer :profile_id, null: false
    	t.string :albname, null: false
    	t.timestamps null: false
    end
  end
end
