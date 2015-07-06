class FixColumn < ActiveRecord::Migration
  def change
  	change_column :profiles, :avatar, :string
  end
end
