class AnnouncementController < ApplicationController
  
  def add
    if request.post?
      @announcement = Announcement.new(params[:announcement])
      session[:announcement] = @announcement
      
      if (@announcement.valid?)
        redirect_to :action => 'preview'
        return
      end
    end
    
    @newsletter = Newsletter.find_by_name(params[:newsletterName])
    @upcoming = Announcement.upcoming(@newsletter)
    if !session[:announcement].nil?
      @announcement = session[:announcement]
    else
      @announcement = Announcement.new
      @announcement.newsletter_id = @newsletter.id
    end
  end
  
  def preview
    if session[:announcement].nil?
      redirect_to :action => 'add'
      return
    end
    
    @newsletter = Newsletter.find_by_name(params[:newsletterName])
    @announcement = session[:announcement]
  end
  
  def submit
    if session[:announcement].nil?
      redirect_to :action => 'add'
      return
    end
    
    @newsletter = Newsletter.find_by_name(params[:newsletterName])
    @announcement = session[:announcement]
    @success = @announcement.save()
    if (@success)
      Notification.event_added(@announcement).deliver
    end
    
    session[:announcement] = nil
  end
end
