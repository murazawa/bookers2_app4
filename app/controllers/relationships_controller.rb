class RelationshipsController < ApplicationController
  before_action :set_user

  # def followings
  #   user = User.find(params[:user_id])
  #   @users = user.followings

  # end

  # def followers
  #   user = User.find(params[:user_id])
  #   @users = user.followers
  # end


  def followings
    @users = @user.followings
    render 'relationships/followings_index'
  end

  def followers
    @users = @user.followers
    render 'relationships/followers_index'
  end


  def create
    following = current_user.follow(@user)
    if following.save
      redirect_back(fallback_location: root_path)
    # フラッシュメッセージ
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    current_user.unfollow(@user)
    redirect_back(fallback_location: root_path)
  end


  private

  def set_user
    @user = User.find(params[:user_id])
  end
end

