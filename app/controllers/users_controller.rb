class UsersController < ApplicationController
  # before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update,:new,:create]
require 'digest/sha1'

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.password = Digest::SHA1.hexdigest(Time.now.to_s.split(//).sort_by{rand}.join)[0..10]

    @user.password_confirmation = @user.password
    unless params[:user][:email].blank?
     if @user.save_without_session_maintenance
      @user.deliver_activation_instructions!
      flash[:notice] = "Your account has been created. Please check your e-mail for your account activation instructions!"

      redirect_to user_path(@user.id)
    else
      render :action => :new
    end
  else
    @user.email = Digest::SHA1.hexdigest(Time.now.to_s.split(//).sort_by{rand}.join)[0..10].to_s + '@manekkattil.com'
    if @user.save
      flash[:notice] = "Successfully added a user"
      redirect_to  user_path(@user.id)
    else
      render :action => :new
    end
  end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end
end

