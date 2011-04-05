class Announcement < ActiveRecord::Base
  belongs_to :newsletter

  def self.upcoming(newsletter)
    where(:newsletter_id => newsletter.id).
    where("announcementdate >= ?", Time.now).
    order("announcementdate asc")
  end


end
