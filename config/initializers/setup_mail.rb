ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "mannekattil.com",
  :user_name            => "suthsuren",
  :password             => "",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
