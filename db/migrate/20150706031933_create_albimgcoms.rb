class CreateAlbimgcoms < ActiveRecord::Migration
  def change
    create_table :albimgcoms do |t|
    	t.integer :album_id
    	t.integer :user_id
    	t.text :content
    	t.timestamps null: false
    end
  end
end
