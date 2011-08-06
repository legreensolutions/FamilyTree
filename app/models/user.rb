class User < ActiveRecord::Base
  ACTIVE = 1

  #authlogic validations
  acts_as_authentic do |c|
    c.validates_presence_of :name
  end
#paperclip image upload
  has_attached_file :photo,
    :styles => {
      :thumb=> "100x100#",
      :small  => "150x150>" }

 # Authlogic automatically executes the following methods, if present, upon user action: active?
  def active?
   # active
   if self.active != User::ACTIVE.to_i
   	return false
   else
     true
   end
  end

	def activate!
    self.active = User::ACTIVE
    save
  end



   # password reset and send mail with a link to reset password
   def deliver_password_reset_instructions!
 		reset_perishable_token!
 		Notifier.deliver_password_reset_instructions(self)
 		end

 	# Activation email sending
 	def deliver_activation_instructions!
    reset_perishable_token!
    Notifier.deliver_activation_instructions(self)
  end

	#Confirmation of account activation email
  def deliver_activation_confirmation!
    reset_perishable_token!
    Notifier.deliver_activation_confirmation(self)
  end


end

