class WeeklyNewsletter < ActionMailer::Base
  default :from => "dante.cassanego@gmail.com"
  
  def newsletter(newsletter)
    @newsletter = newsletter
    @announcements = Announcement.upcoming(@newsletter)    
    
    mail(:to => "netimpact-sloan@mit.edu", :subject => "Net Impact Newsletter")
  end
end
