class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    #@users = User.all
    #もともと上の方
    @users = User.where(activated: true).paginate(page: params[:page])
  end

  def show
    #@user = User.find(params[:id])
    #@posts = @user.posts

    @user = User.find(params[:id])
    redirect_to root_url and return unless @user.activated?
    @posts = @user.posts.paginate(page: params[:page])
  end

  #ここから追加分

  def create
    @user = User.new(user_params)    # params[:user]実装は終わっていないことに注意!
    #マスアサインメント脆弱性
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
      #更新に成功した場合に扱う
    else
      render "edit"
    end
  end


end