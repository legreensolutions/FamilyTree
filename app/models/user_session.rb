class UserSession < Authlogic::Session::Base

  # sujith
  def to_key
    new_record? ? nil : [ self.send(self.class.primary_key) ]
  end

  def persisted?
    false
  end

  # configuration here, see documentation for sub modules of Authlogic::Session
  #generalize_credentials_error_messages true # for a generalized message during failed login
  # will display the default msg or can use the following one with customized msg

  #generalize_credentials_error_messages "Your login information is invalid"

  #Determines which field in the database to be used for loggin in , defulat is login
  login_field :email

  # configuration to set the rememebr me option
  #remember_me true

end

