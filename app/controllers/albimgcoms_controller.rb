class AlbimgcomsController < ApplicationController
	def create
    # binding.pry
    @profile = Profile.find_by_name(params[:profile_id])
    @user = User.find_by_id(@profile.user_id)
    @comment = @profile.comments.create(user_id: current_user.id, content: comment_params[:content], profile_id: @profile.id)
    # redirect_to dish_show_comment_path(@post.id)
    # flash[:notice] = "Thank you for reviewing this product"
    respond_to do |format|
    format.html { redirect_to user_profile_comments_path(@user, @profile) }
    format.js
    # binding.pry
    end
  end

  def destroy
    # binding.pry

    @profile = Profile.find_by_name(params[:profile_id])
    @comment = Comment.find(params[:id])
    respond_to do |format|
      # format.html { redirect_to dish_show_comment_path(@dish.id) }
      format.html { redirect_to user_profile_comments_path(@user, @profile) }
      format.js
    end
    @comment.destroy 
    
  end 

  private
  def comment_params
    params.require(:comment).permit(:user_id, :content, :profile_id)
  end
end
