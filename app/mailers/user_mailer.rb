class UserMailer < ActionMailer::Base
  default_url_options[:host] = "www.mannekattil.com"
  default :from => "mannekattil@mannekattil.com"


  def password_reset_instructions(user)


      @user = user
      @name = user.member.name
      
      #mail :to => user.email, :subject => "Password Reset Instructions from mannekattil.com", :from => "mannekattil@mannekattil.com", :body => :edit_password_reset_url => edit_password_reset_url(user.perishable_token)

      mail :to => user.email, :subject => "Password Reset Instructions from mannekattil.com", :from => "mannekattil@mannekattil.com"

      
 	end


	def activation_instructions(user)   

      @user = user
      #@name = user.member.name
      @account_activation_url = register_url(user.perishable_token)
      @password = user.password
      @email = user.email

      mail :to => user.email, :subject => "Activation Instructions sent", :from => "mannekattil@mannekattil.com"
  


#    subject       "Activation Instructions"
#    from          "mail@mannekattil.com"
#    recipients    user.email
#    sent_on       Time.now
#    body          :account_activation_url => register_url(user.perishable_token),
#                  :user=>user

  end

  def activation_confirmation(user)
      @name = user.member.name
      @root_url = root_url
      @user = user
      mail :to => user.email, :subject => "Activation Complete", :from => "mannekattil@mannekattil.com"


#    subject       "Activation Complete"
#    from          "mail@mannekattil.com"
#    recipients    user.email
#    sent_on       Time.now
#    body          :root_url => root_url

  end

  def send_contact_us_msg(member,msg,from_email)
    
    @to = member.email
    @from = from_email
    @message = msg

    mail :to => member.email, :subject => "Message from a member", :from => from_email

#    subject       "Message from a member"
#    from          from_email
#    recipients    member.email
#    sent_on       Time.now
#    body          :msg => msg,:from=>from_email,:to=>member
  end

end

