class AnnouncementController < ApplicationController
  
  def add
    if request.post?
      session[:announcement] = Announcement.new(params[:announcement])
      redirect_to :action => 'preview'
      return
    end
    
    @newsletter = Newsletter.find_by_name(params[:newsletterName])
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
    
    session[:announcement] = nil
  end
end
