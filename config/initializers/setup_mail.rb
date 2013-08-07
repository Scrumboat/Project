ActionMailer::Base.smtp_settings = {
 :address => "smtp.gmail.com",
 :port => 587,
 :domain => "mail.google.com",
 :user_name => "scrumboat@gmail.com",
 :password => "admin@scrumboat.com",
 :authentication => "plain",
 :enable_starttls_auto => true
 }