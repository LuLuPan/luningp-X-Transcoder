class UsersController < ApplicationController

  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user,     only: :destroy

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
     flash[:success] = " :) Welcome to the X-Transcoding!"
      # Handle a successful save.
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @x_coders = @user.x_coders.paginate(page: params[:page])
  end

  def index
    @users = User.all

  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  def  update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      #handle a successful update
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end


     def correct_user
       @user = User.find(params[:id])
       redirect_to(root_url) unless current_user?(@user)
     end

     def admin_user
       redirect_to(root_url) unless current_user.admin?
     end
end

class Api::UsersController < ApplicationController

  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user,     only: :destroy

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|

    if @user.save
      format.json { render json:@users }
      format.xml { render xml: @users }
      flash[:success] = " :) Welcome to the X-Transcoding!"
      # Handle a successful save.
      redirect_to @user
    else
      format.json { render json:@users }
      format.xml { render xml: @users }
      render 'new'
    end
    end
  end

  def show
    @user = User.find(params[:id])
    @x_coders = @user.x_coders.paginate(page: params[:page])
    respond_to do |format|
      format.json { render json:@users }
      format.xml { render xml: @users }
    end
  end

  def index
    @users = User.all
    respond_to do |format|
      format.json { render json:@users }
      format.xml { render xml: @users }
    end

  end

  def edit
    @user = User.find(params[:id])
    respond_to do |format|
      format.json { render json:@users }
      format.xml { render xml: @users }
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
    respond_to do |format|
      format.json { render json:@users }
      format.xml { render xml: @users }
    end
  end

  def  update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      #handle a successful update
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end


  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end

