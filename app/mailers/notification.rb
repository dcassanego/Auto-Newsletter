class Notification < ActionMailer::Base
  default :from => "mitsloannetimpactmarketing@gmail.com"
  
  def send_reminder(newsletter)
    ActionMailer::Base.smtp_settings[:user_name] = newsletter.from_email
    ActionMailer::Base.smtp_settings[:password] = newsletter.from_pwd
    
    @newsletter = newsletter
    mail( :to => newsletter.moderators.collect {|m| m.email},
          :from => newsletter.from_email,
          :subject => "Send Newsletter Reminder")
  end
  
  def event_added(announcement)
    ActionMailer::Base.smtp_settings[:user_name] = announcement.newsletter.from_email
    ActionMailer::Base.smtp_settings[:password] = announcement.newsletter.from_pwd
    
    @announcement = announcement
    mail( :to => announcement.newsletter.moderators.collect {|m| m.email},
          :from =>  announcement.newsletter.from_email,
          :subject => "New Event Added")
  end
end
