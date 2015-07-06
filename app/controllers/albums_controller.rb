class AlbumsController < ApplicationController
	def index
		@this_user = User.find_by_name(params[:user_id])
		@this_profile = Profile.find_by_name(params[:profile_id])
	end

	def new
		@album = Album.new
		@this_profile = Profile.find_by_name(params[:profile_id])
		@img_list = @album.albumimages.build
	end

	def create
		album_params = params.require(:album).permit( :desc, albumimages_attributes: [:id, :album_id, :imgname])
		album_params["profile_id"] = Profile.find_by_name(params[:profile_id]).id
		album_params["albname"] = params[:album]["albname"]
		@album = Album.new(album_params)

   		respond_to do |format|
     	if @album.save
       		params[:albumimages]['imgname'].each do |a|
          		@albumimage = @album.albumimages.create!(:imgname => a)
       			end
       		format.html { redirect_to user_profile_albums_path , notice: 'Album was successfully created.' }
     	else
       		format.html { render action: 'new' }
     		end
   		end
	end
	def show
		@this_user = User.find_by_name(params[:user_id])
		@this_profile = Profile.find_by_name(params[:profile_id])
		@this_album = Album.find_by_id(params[:id])
		@albumimages = @this_album.albumimages.all
	end

	def destroy
		@this_album = Album.find_by_id(params[:id])
		@this_profile = Profile.find_by_name(params[:profile_id])
		@this_album.albumimages.each do |f|
			f.destroy
		end
		@this_album.destroy
		render action: 'index'
	end
end
