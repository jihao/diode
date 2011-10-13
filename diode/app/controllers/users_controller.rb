class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @jokes = @user.jokes.order(:created_at).page(params[:page])
  end

end
