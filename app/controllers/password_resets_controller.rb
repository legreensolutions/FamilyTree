class PasswordResetsController < ApplicationController
	before_filter :load_user_using_perishable_token, :only => [:edit, :update]
	before_filter :require_user, :only => [:change_password]

  def new
 		render
 	end

 def create
 	@user = User.find_by_email(params[:email])
 	if @user
 		@user.deliver_password_reset_instructions!
 		flash[:notice] = "Instructions to reset your password have been emailed to you. " +
 		"Please check your email."
 		redirect_to login_path
 	else
 		flash[:notice] = "No user was found with that email address"
 		render :action => :new
 	end
 end


 def edit
 	render
 end

 def update
 	if params[:user][:password] == params[:user][:password_confirmation]
 		@user.password = params[:user][:password]
 		@user.password_confirmation = params[:user][:password_confirmation]
    if @user.valid?
 		if @user.update_attribute('password',@user.password)
 			flash[:notice] = "Password successfully updated"
 			redirect_to user_path(@user.id)
 		else
 			render :action => :edit
 		end
	else
	  render :action => :edit
  end
 	else
 		flash[:notice] = "Password mismatch"
 		render :action => :edit
 	end
 end

 def change_password
 	@user = User.find(current_user.id)
 	if request.post?
 		if @user.valid_password?(params[:old_password])
 			if params[:password] == params[:password_confirmation]
	 			@user.password = params[:password]
	 			@user.password_confirmation = params[:password_confirmation]
	 	 	#	if @user.save
	 	 	  if @user.valid?
	 	 	    @user.update_attribute('password',@user.password)
	 		 		flash[:notice] = "Password successfully updated"
	 				redirect_to user_path(@user.id)
	 			else
	 			  render :action=>:change_password
	 				#flash[:notice] =  @user.errors
	 	 		end
	 	else
	 		flash[:notice] = 'password mismatch'
 		end
	else
 		flash[:notice] = 'Old Password incorrect'
 	end
 end
 end


 private
 #To find a user
 		def load_user_using_perishable_token
 			@user = User.find_using_perishable_token(params[:id])
 		unless @user
 			flash[:notice] = "We're sorry, but we could not locate your account. " +
 				"If you are having issues try copying and pasting the URL " +
 				"from your email into your browser or restarting the " +
 				"reset password process."
 			redirect_to user_url(@user.id)
 		end
 	end
end

