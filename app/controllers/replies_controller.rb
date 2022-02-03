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
  end

  def create
    @reply = Reply.new(reply_params)
    post_id = @reply.post.id
    @reply.save!

    #通知メソッドの呼び出し
    @reply.create_reply_notification_by(current_user)

    rescue ActiveRecord::RecordInvalid => e
      pp e.record.errors

    redirect_to reply_path
  end


  def counter_post
    @counter_post = Post.find_by(post_id: self.post_id)
  end


      private
        def reply_params
          params.require(:reply).permit(:dear, :content, :from, :post_id)
        end
end
