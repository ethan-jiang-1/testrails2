class PicturesController < ApplicationController
  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = Picture.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pictures }
    end
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @picture = Picture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/new
  # GET /pictures/new.json
  def new
    @picture = Picture.new
    @picture.uuid = UUIDTools::UUID.random_create.to_s
    @picture.store_loc = "blob"

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/1/edit
  def edit
    @picture = Picture.find(params[:id])
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = Picture.new(params[:picture])

    if !params[:picture][:local_data].blank?
      @picture.content_type = params[:picture][:local_data].content_type
      @picture.store_loc = "blob"
      @picture.store_uri = params[:picture][:local_data].original_filename
      @picture.local_data = params[:picture][:local_data].read
      @picture.save
    end

    respond_to do |format|
      if @picture.save
        format.html { redirect_to @picture, notice: 'Picture was successfully created.' }
        format.json { render json: @picture, status: :created, location: @picture }
      else
        format.html { render action: "new" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pictures/1
  # PUT /pictures/1.json
  def update
    @picture = Picture.find(params[:id])

    #TODO:  Yizhen It is kind of ugly here, need to play more around how to deal with attachment/blob update/create.. later

    if !params[:picture][:local_data].blank?
      @picture.content_type = params[:picture][:local_data].content_type
      @picture.store_uri = params[:picture][:local_data].original_filename
      @picture.local_data = params[:picture][:local_data].read
      @picture.update_attributes(:content_type =>params[:picture][:local_data].content_type)

      respond_to do |format|
        format.html { redirect_to @picture, notice: 'Picture was successfully updated.' }
      end
      return
    end

    respond_to do |format|
      if @picture.update_attributes(params[:picture])
        format.html { redirect_to @picture, notice: 'Picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to pictures_url }
      format.json { head :no_content }
    end
  end

  def blob_picture
    @picture = Picture.find(params[:id])
    send_data @picture.local_data, :type => @picture.content_type, :disposition => 'inline'
  end
end
