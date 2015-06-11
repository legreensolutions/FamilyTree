class User < ActiveRecord::Base
 ACTIVE = 1
  has_one :member,:dependent=>:destroy
  attr_accessible :email, :created_by, :password, :password_confirmation, :is_admin

  # sujith - these attributes added by Sujith
  # attr_accessible :password, :password_confirmation, :is_admin
  
 
  #authlogic validations
  acts_as_authentic do |c|
    validates_presence_of :email
  end


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
 		#Notifier.deliver_password_reset_instructions(self)     #commented by Sujith
 		UserMailer.password_reset_instructions(self).deliver
 		end

 	# Activation email sending
 	def deliver_activation_instructions!
    reset_perishable_token!
    Notifier.activation_instructions(self)
  end

	#Confirmation of account activation email
  def deliver_activation_confirmation!
    reset_perishable_token!
    Notifier.deliver_activation_confirmation(self)
  end

  def is_admin?
    if self.is_admin ==  ADMIN
      true
    end
  end

end

