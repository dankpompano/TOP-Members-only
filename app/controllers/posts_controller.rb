class PostsController < ApplicationController
  before_action :require_login, only: [ :new, :create ]
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(required_content)
    @post.user = current_user

    if @post.save
      redirect_to index_post_path
    else
      puts @post.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def index
  end

  private
  def require_login
    unless logged_in?
      flash[:error] = "You must login to access this section of the page"
      redirect_to new_login_url
    end
  end

  def required_content
    params.require(:post).permit(:topic, :body)
  end

  # def current_user
  #   @current_user ||= User.find_by(id: session[:current_user_id]) if session[:current_user_id]
  # end
end
