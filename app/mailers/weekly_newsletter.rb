class WeeklyNewsletter < ActionMailer::Base
  default :from => "dante.cassanego@gmail.com"
  
  def newsletter(newsletter)
    @newsletter = newsletter
    @announcements = Announcement.
      where(:newsletter_id => @newsletter.id).
      where("announcementdate >= ?", Time.now).
      order("announcementdate asc")    
    
    mail(:to => "dantec@mit.edu", :subject => "NI Events")
  end
end
