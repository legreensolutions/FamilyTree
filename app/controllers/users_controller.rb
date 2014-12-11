class UsersController < ApplicationController
  # before_filter :require_no_user, :only => [:new, :create]
 # before_filter :require_user, :only => [:show, :edit, :update,:new,:create]

# before_filter :require_user, :only => [:index, :edit, :update,:new,:create]
require 'digest/sha1'
  def index
    if params[:search]
       @users = User.find(:all,:conditions=>['email LIKE ? ',"%#{params[:search_text]}%"],:order => "id DESC")
    else
      @users = User.all
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.password = Digest::SHA1.hexdigest(Time.now.to_s.split(//).sort_by{rand}.join)[0..10]

    @user.password_confirmation = @user.password
     if @user.save_without_session_maintenance
      @user.deliver_activation_instructions!
      flash[:notice] = "Your account has been created. Please check your e-mail for your account activation instructions!"
      redirect_to user_path(@user.id)
    else
      render :action => :new
    end

  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    # sujith
    # @user = User.find(params[:id])
    @user = current_user
  end

  def update
    #@user = User.find(params[:id]) # makes our views "cleaner" and more consistent
    @user = current_user # makes our views "cleaner" and more consistent

    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to user_path(@user.id)
    else
      render :action => :edit
    end
  end
end

