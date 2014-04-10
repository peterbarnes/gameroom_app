# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
GameroomApp::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => ENV["SG_USERNAME"],
  :password => ENV["SG_PASSWORD"],
  :domain => 'gameroom.herokuapp.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
