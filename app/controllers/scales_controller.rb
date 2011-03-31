class ScalesController < ApplicationController
  respond_to :html, :js

  # GET /scales
  # GET /scales.xml
  def index
    @scales = Scale.all
    respond_with @scales
  end

  # GET /scales/1
  # GET /scales/1.xml
  def show
    @scale = Scale.find(params[:id])
    session[:root_note] = params[:root] && params[:root].to_i
    session[:root_note] ||= 0;
    @root_note = session[:root_note]
    @tuning = Scale::DEFAULT_TUNING

    respond_with @scale
  end

  # GET /scales/new
  # GET /scales/new.xml
  def new
    @scale = Scale.new

    respond_with @scale
  end

  # GET /scales/1/edit
  def edit
    @scale = Scale.find(params[:id])
  end

  # POST /scales
  # POST /scales.xml
  def create
    @scale = Scale.new(params[:scale])

    respond_to do |format|
      if @scale.save
        format.html { redirect_to(@scale, :notice => 'Scale was successfully created.') }
        format.xml  { render :xml => @scale, :status => :created, :location => @scale }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @scale.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /scales/1
  # PUT /scales/1.xml
  def update
    @scale = Scale.find(params[:id])

    respond_to do |format|
      if @scale.update_attributes(params[:scale])
        format.html { redirect_to(@scale, :notice => 'Scale was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @scale.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /scales/1
  # DELETE /scales/1.xml
  def destroy
    @scale = Scale.find(params[:id])
    @scale.destroy

    respond_to do |format|
      format.html { redirect_to(scales_url) }
      format.xml  { head :ok }
    end
  end
end
