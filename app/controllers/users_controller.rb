class UsersController < ApplicationController
  before_action :authenticate_user!

  #def index
    #@users = User.all
    #もともと上の方
    #@users = User.where(activated: true).paginate(page: params[:page])
  #end

  #def show
    #@user = User.find(params[:id])
    #@posts = @user.posts

    #@user = User.find(params[:id])
    #redirect_to root_url and return unless @user.activated?
    #@posts = @user.posts.paginate(page: params[:page])
  #end

  #ここから追加分

  def initialize
    @user.received_at = params[received_at: :Time.now]
  end


  def create
    @user = User.new(user_params)
    #params[:user]実装は終わっていないことに注意!
    #マスアサインメント脆弱性
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url, notice: "Please check your email to activate your account."
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to root_url
  end

  #Railsガイド参照
  def receive
    @user.received_at = User.update(received_at: Time.now)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
      #更新に成功した場合に扱う
    else
      render "edit"
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :birthday, :received_at, )
    end

end