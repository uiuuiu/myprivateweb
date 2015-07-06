class WelcomeController < ApplicationController
	def index
		@profile_list= Array.new
		@album_profile_list= Array.new
		@album_user_list= Array.new

		@user_last_list = User.last(3)
		@album_last_list = Album.last(4)

		@album_last_list.each do |f|
			@album_profile_list.push(Profile.find_by_id(f.profile_id))
		end
		@album_profile_list.each do|f|
			@album_user_list.push(User.find_by_id(f.user_id))
		end
		@profiles = Profile.all
		# binding.pry
		@user_last_list.each do |f|
			@profile_list.push(Profile.where("user_id = '#{f.id}'").last)
		end
	end
end
