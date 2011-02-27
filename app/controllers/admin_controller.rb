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
    # admin controls for a newsletter including edit content, approve, send
    @newsletter = Newsletter.find_by_name( params[:newsletterName])
  end
end
