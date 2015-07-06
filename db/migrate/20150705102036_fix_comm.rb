class FixComm < ActiveRecord::Migration
  def change
  	rename_column :comments, :profle_id, :profile_id
  end
end
