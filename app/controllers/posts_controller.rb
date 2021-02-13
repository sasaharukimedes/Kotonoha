class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @user =@post.user
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.sender_id = current_user.id 
    # sender_idの情報はフォームからはきていないので、deviseのメソッドを使って「ログインしている自分のid」を代入
    @post.receiver_id = User.where.not(id:current_user.id).order(:received_at).first.id

    @post.save!
    redirect_to posts_path
    #自分で書いたやつ@post.receiver_id = User.id.where.not(id:current_user.id).order(received_at).first
  end

    private 
        def post_params
          params.require(:post).permit(:dear, :content, :from)
        end
end
