# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Familynew::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'sujithsurendran',
  :password => 'SendGridSuj!th123',
  :domain => 'mannekkatil.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}

