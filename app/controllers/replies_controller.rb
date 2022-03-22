class RepliesController < ApplicationController
  before_action :authenticate_user!

  def index
    @replies = Reply.all
  end

  def show
    @reply = Reply.find(params[:id])
  end

  def new
    @reply = Reply.new
    @post = Post.find(params[:post_id])
  end

  def create
    @reply = Reply.new(reply_params)
    @post = Post.find(params[:post_id])
    @reply.post_id = @post.id
    if @reply.save
      @reply.save!
      #通知メソッドの呼び出し
      @reply.create_notification_by(current_user)
      flash[:notice] = "返事が作られました!"
      redirect_to home_path
    else
      render "new"
    end

    rescue ActiveRecord::RecordInvalid => e
      pp e.record.errors



  end


      private
        def reply_params
          params.require(:reply).permit(:dear, :content, :from, :post_id)
        end
end
