desc "Cron task called by the heroku cron add on at a weekly interval..."
task :cron => :environment do
 
 newsletters = Newsletter.find(:all)
 newsletters.each do |newsletter|
  Notification.send_reminder(newsletter).deliver
 end

end