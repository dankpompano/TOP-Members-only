class PostsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path, notice: "Post created successfully"
    else
      puts @post.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @posts = Post.all
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
