class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.string :name,			null: false, default: ""
    	t.text :content,		null: false
    	t.integer :user_id
    end
  end
end
