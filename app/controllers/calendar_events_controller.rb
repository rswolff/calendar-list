class CalendarEventsController < ApplicationController
  
  before_filter :login_required, :set_default_weeks
  
  # GET /calendar_events
  # GET /calendar_events.xml
  def index
    @calendar_events = CalendarEvent.future.paginate :page => params[:page], :order => 'start_date'
   
    respond_to do |format|
      format.html # index.html.erb
      format.iphone { render :layout => false }
      format.xml  { render :xml => @calendar_events }
    end
  end

  # GET /calendar_events/1
  # GET /calendar_events/1.xml
  def show
    @calendar_event = CalendarEvent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @calendar_event }
    end
  end

  # GET /calendar_events/new
  # GET /calendar_events/new.xml
  def new
    @calendar_event = CalendarEvent.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @calendar_event }
    end
  end

  # GET /calendar_events/1/edit
  def edit
    @calendar_event = CalendarEvent.find(params[:id])
    unless @calendar_event.start_time.nil?
      @calendar_event.start_time = @calendar_event.start_time.strftime("%H:%M %p")
    end
  end

  # POST /calendar_events
  # POST /calendar_events.xml
  def create
    @calendar_event = CalendarEvent.new(params[:calendar_event])
    @calendar_event.tag_list = params[:tags]
    
    respond_to do |format|
      if @calendar_event.save
        flash[:notice] = "The event \"#{@calendar_event.name}\" was created."
        format.html { redirect_to(calendar_events_path) }
        format.xml  { render :xml => @calendar_event, :status => :created, :location => @calendar_event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @calendar_event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /calendar_events/1
  # PUT /calendar_events/1.xml
  def update
    @calendar_event = CalendarEvent.find(params[:id])

    respond_to do |format|
      if @calendar_event.update_attributes(params[:calendar_event])
        flash[:notice] = "The event \"#{@calendar_event.name}\" was updated."
        format.html { redirect_to(calendar_events_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @calendar_event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /calendar_events/1
  # DELETE /calendar_events/1.xml
  def destroy
    @calendar_event = CalendarEvent.find(params[:id])
    @calendar_event.destroy

    respond_to do |format|
      format.html { redirect_to(calendar_events_url) }
      format.xml  { head :ok }
    end
  end
  
  def rolling
    #n = params[:n].to_i
    #s = Date.today
    #e = n.weeks.from_now
    #@calendar_events = CalendarEvent.in_range(s,e).paginate :page => params[:page], :order => 'start_date'
    #TODO: This has to be changed to find all events in a range of weekss
    @days = Day.find(:all, :conditions => ["d #{(Date.today.to_date..6.weeks.from_now.to_date ).to_s(:db)}"]).paginate :page => params[:page]
    render :template => "calendar_events/index"
  end
  
  def print_rolling
    n = params[:n].to_i
    s = Date.today
    e = n.weeks.from_now
    @calendar_events = CalendarEvent.in_range(s,e)
    render :layout => 'print'
  end
  
  def by_month
    s = Date.civil(y=params[:year].to_i, m=params[:month].to_i, d=1)
    e = Date.civil(y=params[:year].to_i, m=params[:month].to_i, d=-1)
    @calendar_events = CalendarEvent.in_range(s,e)
    render :template => "calendar_events/index"
  end
  
  def toggle_emphasis
    respond_to do |format|
      format.js {
        @calendar_event = CalendarEvent.find(params[:id])
        @calendar_event.toggle_emphasis
        @calendar_event.save        
      }
    end
  end
  
  def set_default_weeks
    params[:n] ||= 12
    @start = Date.today
    @end = params[:n].to_i.weeks.from_now
  end
end
