class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index] #:show]

  def index
    @posts = Post.all.order(created_at: :desc).limit(10)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    #receiverのくだりがうまくいかない
    @post = Post.new(post_params)
    @post.sender_id = current_user.id
    @receiver = User.where.not(id:current_user.id).order(:received_at).first
    @post.receiver_id = @receiver.id
    @post.save!

    @receiver.update!(received_at: Time.current)

    #こっちはrailsガイド参考
    #@user.received_at = User.update(received_at: Time.current)
    @user.received_at = User.update(received_at: Time.current)
    redirect_to posts_path
  end


    private
        def post_params
          params.require(:post).permit(:dear, :content, :from, :sender_id, :receiver_id)
        end
end
