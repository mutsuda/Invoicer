class BlipsController < ApplicationController
  # GET /blips
  # GET /blips.xml
  def index
    @blips = Blip.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @blips }
    end
  end

  # GET /blips/1
  # GET /blips/1.xml
  def show
    @blip = Blip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @blip }
    end
  end

  # GET /blips/new
  # GET /blips/new.xml
  def new
    @blip = Blip.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @blip }
    end
  end

  # GET /blips/1/edit
  def edit
    @blip = Blip.find(params[:id])
  end

  # POST /blips
  # POST /blips.xml
  def create
    @blip = Blip.create!(params[:blip])
    flash[:notice] = "Blip added!"
    respond_to do |format|
     # if @blip.save
        format.html { redirect_to(@blip, :notice => 'Blip was successfully created.') }
        format.xml  { render :xml => @blip, :status => :created, :location => @blip }
        format.js
     # else
     #   format.html { render :action => "new" }
     #   format.xml  { render :xml => @blip.errors, :status => :unprocessable_entity }
     # end
    end
  end

  # PUT /blips/1
  # PUT /blips/1.xml
  def update
    @blip = Blip.find(params[:id])

    respond_to do |format|
      if @blip.update_attributes(params[:blip])
        format.html { redirect_to(@blip, :notice => 'Blip was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @blip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /blips/1
  # DELETE /blips/1.xml
  def destroy
    @blip = Blip.find(params[:id])
    i = @blip.invoice_id
    @inv = Invoice.find(i)
    @blip.destroy

    respond_to do |format|
      format.html { redirect_to(@inv) }
      format.xml  { head :ok }
      format.js
    end
  end
end
