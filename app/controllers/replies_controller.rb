class RepliesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @replies = Reply.all.order(created_at: :desc)
  end

  def show
    @reply = Reply.find(params[:id])
  end

  def new
    @reply = Reply.new
  end

  def create
    @reply = Reply.new(reply_params)

    @reply.save!
    redirect_to reply_path
  end




      private 
        def reply_params
          params.require(:reply).permit(:dear, :content, :from, :post_id)
        end
end
