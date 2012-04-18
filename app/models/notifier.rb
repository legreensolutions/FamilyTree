class Notifier < ActionMailer::Base
  default_url_options[:host] = "www.mannekattil.com"

  def password_reset_instructions(user)
 			subject       "Password Reset Instructions"
 			from          "mail@mannekattil.com""mail@mannekattil.com"
 			recipients    user.email
 			sent_on       Time.now
 			body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
 	end


	def activation_instructions(user)
    subject       "Activation Instructions"
    from          "mail@mannekattil.com"
    recipients    user.email
    sent_on       Time.now
    body          :account_activation_url => register_url(user.perishable_token),
                  :user=>user

  end

  def activation_confirmation(user)
    subject       "Activation Complete"
    from          "mail@mannekattil.com"
    recipients    user.email
    sent_on       Time.now
    body          :root_url => root_url
  end

  def send_contact_us_msg(member,msg,user)
    subject       "Message from a member"
    from          user.email
    recipients    member.email
    sent_on       Time.now
    body          :msg => msg,:from=>user.email,:to=>member
  end

end

