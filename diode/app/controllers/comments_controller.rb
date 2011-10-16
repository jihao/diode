class CommentsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  layout "user_home",:except=>[:rss,:atom,:json]
  
  respond_to :html,:xml,:json,:js
  
  def index
    @joke = Joke.find(params[:joke_id])
    @comments = @joke.comments.order(:created_at).page(params[:page])
    respond_with(@comments)
  end
  def create
    @joke = Joke.find(params[:joke_id])
    @comment = @joke.comments.create(params[:comment])
    respond_with(@joke)
  end
  def show
  end
  def new
  end
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    
    @joke = Joke.find(params[:joke_id])
    respond_with(@joke)
  end
  
end
