class RepliesController < ApplicationController
  before_action :authenticate_user!

  def index
    @replies = Reply.all.order(created_at: :desc).limit(10)
  end

  def show
    @reply = Reply.find(params[:id])
  end

  def new
    @reply = Reply.new
  end

  def create
    @reply = Reply.new(reply_params)
    @reply.post_id = current_user.post.id
    @reply.save!

    #通知メソッドの呼び出し
    @reply.create_reply_notification_by(current_user)

    rescue ActiveRecord::RecordInvalid => e
      pp e.record.errors

    redirect_to reply_path
  end


      private
        def reply_params
          params.require(:reply).permit(:dear, :content, :from, :post_id)
        end
end
