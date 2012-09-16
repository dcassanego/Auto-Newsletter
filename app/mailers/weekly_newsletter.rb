class WeeklyNewsletter < ActionMailer::Base
  default :from => "mitsloannetimpactmarketing@gmail.com"
  
  def newsletter(newsletter, update)
    ActionMailer::Base.smtp_settings[:user_name] = newsletter.from_email
    ActionMailer::Base.smtp_settings[:password] = newsletter.from_pwd
    
    @newsletter = newsletter
    @announcements = Announcement.upcoming(@newsletter)
    @update = update    
    
    mail(:to => @newsletter.sendaddress, :from => newsletter.from_email, :subject => newsletter.subject)
  end
end
