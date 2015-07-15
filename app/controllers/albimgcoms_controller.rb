class AlbimgcomsController < ApplicationController
	def create
    @albumimg = Albumimage.find_by_id(params[:albumimage_id])
    @album = Album.find_by_id(params[:album_id])
    @profile = Profile.find_by_name(params[:profile_id])
    @user = User.find_by_id(@profile.user_id)
    @comment = @albumimg.albimgcoms.create(user_id: current_user.id, content: comment_params[:content], album_id: @album.id, albumimage_id: @albumimg.id)
    # redirect_to dish_show_comment_path(@post.id)
    # flash[:notice] = "Thank you for reviewing this product"
    respond_to do |format|
    format.html { redirect_to user_profile_album_path(@user, @profile, @album) }
    format.js
    # binding.pry
    end
  end

  def destroy
    @albumimg = Albumimage.find_by_id(params[:albumimage_id])
    @album = Album.find_by_id(params[:album_id])
    @profile = Profile.find_by_name(params[:profile_id])
    @user = User.find_by_id(@profile.user_id)
    @comment = Albimgcom.find(params[:id])
    respond_to do |format|
      # format.html { redirect_to dish_show_comment_path(@dish.id) }
      format.html { redirect_to user_profile_album_path(@user, @profile, @album) }
      format.js
    end
    @comment.destroy 
  end 

  private
  def comment_params
    params.require(:albimgcom).permit(:user_id, :content, :profile_id)
  end
end
