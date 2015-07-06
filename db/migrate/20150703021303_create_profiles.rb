class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    	t.integer :user_id, 	null: false
    	t.integer :age,			null: false
    	t.string  :profession,  null: false
    	t.text    :exp,			null: false
    	t.text    :hobbies,		null: false
    	t.text	  :desc, 		null: false
        t.timestamps null: false
    end
  end
end