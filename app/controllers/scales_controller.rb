class ScalesController < ApplicationController
  respond_to :html, :js

  # GET /scales
  # GET /scales.xml
  def index
    @scales = Scale.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @scales }
    end
  end

  # GET /scales/1
  # GET /scales/1.xml
  def show
    @scale = Scale.find(params[:id])
    session[:root_note] = params[:root].to_i if params[:root]
    session[:root_note] ||= 0
    @root_note = session[:root_note]
    @tuning = Scale::DEFAULT_TUNING

    respond_with @scale
  end

  # GET /scales/new
  # GET /scales/new.xml
  def new
    @scale = Scale.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @scale }
    end
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


  # def set_root
  #   if (0..11).include?( params[:note].to_i )
  #     session[:root_note] = params[:note].to_i
  #   end

  #   @scale = Scale.find(params[:id])
  #   @tuning = Scale::DEFAULT_TUNING
  #   render 'show'
  # end

  # private

  # def check_root_note
  #   @root_note = session[:root_note] || 0
  # end
end
