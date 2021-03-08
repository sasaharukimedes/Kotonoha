class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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
    #うまく行かないので一旦適当に書いて実装

    receiver_id = User.all.where.not(id:current_user.id).order(:received_at).first.id

    @post = Post.new(post_params)
    @post.sender_id = current_user.id
    @post.receiver_id = receiver_id
    @post.save!

    receiver.update!(received_at: Time.current)
    redirect_to posts_path
  end



    private 
        def post_params
          params.require(:post).permit(:dear, :content, :from, :sender_id, :receiver_id)
        end
end
