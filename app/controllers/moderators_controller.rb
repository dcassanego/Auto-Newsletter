class ModeratorsController < ApplicationController
  before_filter :authenticate
  
  # GET /moderators
  # GET /moderators.xml
  def index
    @moderators = Moderator.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @moderators }
    end
  end

  # GET /moderators/1
  # GET /moderators/1.xml
  def show
    @moderator = Moderator.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @moderator }
    end
  end

  # GET /moderators/new
  # GET /moderators/new.xml
  def new
    @moderator = Moderator.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @moderator }
    end
  end

  # GET /moderators/1/edit
  def edit
    @moderator = Moderator.find(params[:id])
  end

  # POST /moderators
  # POST /moderators.xml
  def create
    @moderator = Moderator.new(params[:moderator])

    respond_to do |format|
      if @moderator.save
        format.html { redirect_to(@moderator, :notice => 'Moderator was successfully created.') }
        format.xml  { render :xml => @moderator, :status => :created, :location => @moderator }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @moderator.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /moderators/1
  # PUT /moderators/1.xml
  def update
    @moderator = Moderator.find(params[:id])

    respond_to do |format|
      if @moderator.update_attributes(params[:moderator])
        format.html { redirect_to(@moderator, :notice => 'Moderator was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @moderator.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /moderators/1
  # DELETE /moderators/1.xml
  def destroy
    @moderator = Moderator.find(params[:id])
    @moderator.destroy

    respond_to do |format|
      format.html { redirect_to(moderators_url) }
      format.xml  { head :ok }
    end
  end
end
