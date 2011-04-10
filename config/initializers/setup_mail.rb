ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.perform_deliveries = true

ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => ENV['GMAIL_ACC'],
  :password             => ENV['GMAIL_PASS'],
  :authentication       => :plain,
  :enable_starttls_auto => true
}

Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?