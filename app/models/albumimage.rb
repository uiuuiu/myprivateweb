class Albumimage < ActiveRecord::Base
	mount_uploader :imgname, PictureUploader
   	belongs_to :album
   	has_many :comments
   	has_many :albimgcoms
end
