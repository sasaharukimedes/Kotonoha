class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.sender_id = current_user.id
    @receiver = User.where.not(id:current_user.id).order(:received_at).first
    @post.receiver_id = @receiver.id
    @post.save!
    @receiver.update!(received_at: Time.now)
    @post.create_notification_by(current_user)

    flash[:notice] = "手紙が作られました!"
    redirect_to home_path

    rescue ActiveRecord::RecordInvalid => e
      pp e.record.errors

  end


    private
        def post_params
          params.require(:post).permit(:dear, :content, :from, :sender_id, :receiver_id, :user_id)
        end
end
