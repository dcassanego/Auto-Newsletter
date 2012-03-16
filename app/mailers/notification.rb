class Notification < ActionMailer::Base
  default :from => "mitsloannetimpactmarketing@gmail.com"
  
  def send_reminder(newsletter)
    @newsletter = newsletter
    mail( :to => ["neil.mcquarrie@sloan.mit.edu", "hardynat@yahoo.com", "elena.schrum@sloan.mit.edu"], 
          :subject => "Send Newsletter Reminder")
  end
  
  def event_added(announcement)
    @announcement = announcement
    mail( :to => ["neil.mcquarrie@sloan.mit.edu", "hardynat@yahoo.com", "elena.schrum@sloan.mit.edu"], 
          :subject => "New Event Added")
  end
end
