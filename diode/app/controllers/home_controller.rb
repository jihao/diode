class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  
  def index
  end
  
  def show
    @user = User.find(params[:user_id])
    # @jokes = @user.jokes.order(:created_at).page(params[:page])
    @jokes = @user.feed_jokes.page(params[:page])
    # Note: 
    #  user_object.feed_jokes 
    #  Joke.from_users_followed_by(user)
    render(:layout=>"users")
  end
  
  def show_user_jokes
    puts params[:user_id]
  end
end

