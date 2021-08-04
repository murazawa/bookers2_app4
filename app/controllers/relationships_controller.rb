class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:id])
    following = current_user.follow(@user)
    if following.save
      redirect_back(fallback_location: root_path)
    # フラッシュメッセージ
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @user = User.find(params[:id])
    current_user.unfollow(@user)
    redirect_back(fallback_location: root_path)
  end



end

