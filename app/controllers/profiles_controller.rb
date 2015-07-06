class ProfilesController < ApplicationController
	def index
		# binding.pry
		# @profile = Profile.find_by_name(params[:user_id])
		@user = User.find_by_name(params[:user_id])
		@profile_list = @user.profiles
	end

	def new
		@profile = Profile.new
	end

	def create
		profile_params = params.require(:profile).permit( :name, :age, :profession, :exp, :hobbies, :desc, :avatar)
		profile_params["user_id"] = User.find_by_name(params[:user_id]).id
		@profile = Profile.new(profile_params)
		if @profile.save
        redirect_to user_profiles_path
      else
        render 'new'
      end 
	end

	def show
		@this_user = User.find_by_name(params[:user_id])
		@this_user_profile = Profile.find_by_name(params[:id])
	end

	def update
      @profile = Profile.find_by_name(params[:id])
      if @profile.update(params.require(:profile).permit(:name, :age, :profession, :exp, :hobbies, :desc, :avatar))
        redirect_to user_profile_path(current_user, @profile)
      else 
        render 'edit'
      end
    end

	def edit
		@profile = Profile.find_by_name(params[:id])
	end

	def destroy
		@profile = Profile.find_by_name(params[:id])
		@comments = Comment.where("profile_id = '#{@profile.id}'")
		@comments.each do |f|
			f.destroy
		end
		@albums = Album.where("profile_id = '#{@profile.id}'")
		@albums.each do |f|
			f.albumimages.each do |n|
				n.destroy
			end
			f.destroy
		end
		@profile.destroy
		redirect_to action: 'index'
	end
end
