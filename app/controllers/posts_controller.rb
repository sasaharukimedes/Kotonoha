class PostsController < ApplicationController
  
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to "/about"
    else
      redirect_to "/"
    end
  end

    private 
        def post_params
          params.permit(:content)
          #一旦requireを消してみる
        end
  
end
