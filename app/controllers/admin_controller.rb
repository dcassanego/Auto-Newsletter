class AdminController < ApplicationController
  before_filter :authenticate
  
  def index
    # homepage with list of all newsletters and their corresponding organizations
    @newsletters = Newsletter.find(:all)
  end
  
  def add
    if !params[:id].nil? 
      @newsletter = Newsletter.find(params[:id])
    else 
      @newsletter = Newsletter.new(params[:newsletter])
    end
    
    if request.post?
      if (@newsletter.update_attributes(params[:newsletter]))
        redirect_to :action => 'newsletter', :newsletterName => @newsletter.name
      end
    end
  end
  
  def newsletter
    session[:update] = params[:update] if params[:update].present?
    
    # admin controls for a newsletter including edit content, approve, send
    @newsletter = Newsletter.find_by_name(params[:newsletterName])
    @announcements = Announcement.upcoming(@newsletter)
  end
  
  def edit
    @newsletter = Newsletter.find_by_name(params[:newsletterName])
    @announcement = Announcement.find(params[:id])
    
    if (request.post?)
      @announcement.update_attributes(params[:announcement])
      if (@announcement.save)
        redirect_to :action => 'newsletter', :newsletterName => @newsletter.name
        return
      end
    end
  end
  
  def preview
    @newsletter = Newsletter.find_by_name(params[:newsletterName])
    @announcements = Announcement.upcoming(@newsletter)
  end
  
  def sendNewsletter
    @newsletter = Newsletter.find_by_name(params[:newsletterName])
    WeeklyNewsletter.newsletter(@newsletter, session[:update]).deliver
    
    redirect_to :action => 'confirmation', :newsletterName => @newsletter.name
  end
  
  def confirmation
    
  end
end
