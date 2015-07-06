class Profile < ActiveRecord::Base
	mount_uploader :avatar, PictureUploader
	has_many :comments
	has_many :albums
	belongs_to :user
	def to_param 
    	name
  	end
end
