# Load the Rails application.
require_relative 'application'
require 'carrierwave/orm/activerecord'
# Initialize the Rails application.
ActionMailer::Base.smtp_settings = {
  :user_name => 'SENDGRID_USERNAME',
  :password => 'SENDGRID_PASSWORD',
  :domain => 'pointedapp.herokuapp.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
Rails.application.initialize!
