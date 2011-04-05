class Announcement < ActiveRecord::Base
  belongs_to :newsletter
  
  validates_length_of :title, :maximum => 200, :allow_blank => false
  validates_length_of :description, :maximum => 2000, :allow_blank => false
  validates_length_of :url, :maximum => 200, :allow_blank => true
  validates_length_of :contact, :maximum => 200, :allow_blank => false
  validates_length_of :time, :maximum => 200, :allow_blank => false
  validates_length_of :location, :maximum => 200, :allow_blank => false

  def self.upcoming(newsletter)
    where(:newsletter_id => newsletter.id).
    where("announcementdate >= ?", Time.now).
    order("announcementdate asc")
  end

end
