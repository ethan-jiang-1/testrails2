class GmapUsersController < ApplicationController

  # GET /gmap_users
  # GET /gmap_users.json
  def index
    @gmap_users = GmapUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gmap_users }
    end
  end

  # GET /gmap_users/1
  # GET /gmap_users/1.json
  def show
    @gmap_user = GmapUser.find(params[:id])

    @json = GmapUser.all.to_gmaps4rails

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gmap_user }
    end
  end

  # GET /gmap_users/new
  # GET /gmap_users/new.json
  def new
    @gmap_user = GmapUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gmap_user }
    end
  end

  # GET /gmap_users/1/edit
  def edit
    @gmap_user = GmapUser.find(params[:id])
  end

  # POST /gmap_users
  # POST /gmap_users.json
  def create
    @gmap_user = GmapUser.new(params[:gmap_user])

    respond_to do |format|
      if @gmap_user.save
        format.html { redirect_to @gmap_user, notice: 'Gmap user was successfully created.' }
        format.json { render json: @gmap_user, status: :created, location: @gmap_user }
      else
        format.html { render action: "new" }
        format.json { render json: @gmap_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gmap_users/1
  # PUT /gmap_users/1.json
  def update
    @gmap_user = GmapUser.find(params[:id])

    respond_to do |format|
      if @gmap_user.update_attributes(params[:gmap_user])
        format.html { redirect_to @gmap_user, notice: 'Gmap user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gmap_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gmap_users/1
  # DELETE /gmap_users/1.json
  def destroy
    @gmap_user = GmapUser.find(params[:id])
    @gmap_user.destroy

    respond_to do |format|
      format.html { redirect_to gmap_users_url }
      format.json { head :no_content }
    end
  end
end
