class RelationshipsController < ApplicationController
  before_filter :authenticate_user!

    def create
      @user = User.find(params[:relationship][:followed_id])
      current_user.follow!(@user)
      respond_to do |format|
          format.html { redirect_to @user,:notice=>'关注成功' }
          format.js
      end
    end

    def destroy
      @user = Relationship.find(params[:id]).followed
      current_user.unfollow!(@user)
      respond_to do |format|
          format.html { redirect_to @user,:notice=>'取消关注成功' }
          format.js
      end
    end
end
