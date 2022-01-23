class PostsController < ApplicationController
  before_action :authenticate_user!

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
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.sender_id = current_user.id
    @receiver = User.where.not(id:current_user.id).order(:received_at).first
    @post.receiver_id = @receiver.id
    @post.save!

    @post.create_notification_by(current_user)
    respond_to do |format|
      format.html {redirect_to request.referrer}
      format.js
    end


    rescue ActiveRecord::RecordInvalid => e
      pp e.record.errors

    @receiver.update!(received_at: :Time.now)

    redirect_to posts_path notice, flash: {success: "手紙は誰かのもとへ届きました!"}
    #なぜ表示されない？？
  end


    private
        def post_params
          params.require(:post).permit(:dear, :content, :from, :sender_id, :receiver_id, :user_id)
        end
end
