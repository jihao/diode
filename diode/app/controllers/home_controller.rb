class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  
  def index
  end
  
  def show
    @user = User.find(params[:user_id])
    if @user != current_user 
      redirect_to :action => "show_user_jokes", :user_id => params[:user_id]
    else
      render(:layout=>"user_home")
    end
  end
  
  def show_user_jokes
    puts params[:user_id]
  end
end

