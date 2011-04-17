class Notification < ActionMailer::Base
  default :from => "dante.cassanego@gmail.com"
  
  def send_reminder(newsletter)
    @newsletter = newsletter
    mail(:to => ["ak_12@mit.edu", "dantec@mit.edu"], :subject => "Send Newsletter Reminder")
  end
  
  def event_added(announcement)
    @announcement = announcement
    mail(:to => ["ak_12@mit.edu", "dantec@mit.edu"], :subject => "New Event Added")
  end
end
