class CalendarEventPresetsController < ApplicationController
  
  before_filter :login_required
  
  # GET /calendar_event_presets
  # GET /calendar_event_presets.xml
  def index
    @calendar_event_presets = CalendarEventPreset.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @calendar_event_presets }
    end
  end

  # GET /calendar_event_presets/1
  # GET /calendar_event_presets/1.xml
  def show
    @calendar_event_preset = CalendarEventPreset.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @calendar_event_preset }
    end
  end

  # GET /calendar_event_presets/new
  # GET /calendar_event_presets/new.xml
  def new
    @calendar_event_preset = CalendarEventPreset.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @calendar_event_preset }
    end
  end

  # GET /calendar_event_presets/1/edit
  def edit
    @calendar_event_preset = CalendarEventPreset.find(params[:id])
  end

  # POST /calendar_event_presets
  # POST /calendar_event_presets.xml
  def create
    @calendar_event_preset = CalendarEventPreset.new(params[:calendar_event_preset])

    respond_to do |format|
      if @calendar_event_preset.save
        flash[:notice] = 'CalendarEventPreset was successfully created.'
        format.html { redirect_to(@calendar_event_preset) }
        format.xml  { render :xml => @calendar_event_preset, :status => :created, :location => @calendar_event_preset }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @calendar_event_preset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /calendar_event_presets/1
  # PUT /calendar_event_presets/1.xml
  def update
    @calendar_event_preset = CalendarEventPreset.find(params[:id])

    respond_to do |format|
      if @calendar_event_preset.update_attributes(params[:calendar_event_preset])
        flash[:notice] = 'CalendarEventPreset was successfully updated.'
        format.html { redirect_to(@calendar_event_preset) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @calendar_event_preset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /calendar_event_presets/1
  # DELETE /calendar_event_presets/1.xml
  def destroy
    @calendar_event_preset = CalendarEventPreset.find(params[:id])
    @calendar_event_preset.destroy

    respond_to do |format|
      format.html { redirect_to(calendar_event_presets_url) }
      format.xml  { head :ok }
    end
  end
  
  def search
    @calendar_event_presets = CalendarEventPreset.find(:all, :conditions => ["event_name LIKE ?", "#{params[:q]}%"])
    
    respond_to do |format|
      format.js {
          render :template => false
      }
    end
  end
end
