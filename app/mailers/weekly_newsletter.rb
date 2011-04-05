class WeeklyNewsletter < ActionMailer::Base
  default :from => "dante.cassanego@gmail.com"
  
  def newsletter(newsletter)
    @newsletter = newsletter
    @announcements = Announcement.upcoming(@newsletter)    
    
    mail(:to => "dantec@mit.edu", :subject => "NI Events")
  end
end
