desc "Cron task called by the heroku cron add on at a weekly interval..."
task :cron => :environment do
 
  #Run the task if it's Sunday
  if Time.now.wday == 0 || Rails.env.development? 
    newsletters = Newsletter.find(:all)
    newsletters.each do |newsletter|
      Notification.send_reminder(newsletter).deliver if newsletter.active
    end
  end

end