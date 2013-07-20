class PostCommentsController < ApplicationController
  respond_to :html, :xml, :json

  # GET /comments
  # GET /comments.json
  def index
    @post_comments = PostComment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @post_comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @post_comment = PostComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post_comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @post_comment = PostComment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post_comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @post_comment = PostComment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def createx
    @post_comment = PostComment.new(params[:post_comment])

    respond_to do |format|
      if @post_comment.save
        format.html { redirect_to @post_comment, notice: 'Comment was successfully created.' }
        format.json { render json: @post_comment, status: :created, location: @post_comment }
      else
        format.html { render action: "new" }
        format.json { render json: @post_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @post_comment = PostComment.new( params[:post_comment] )

    if @post_comment.save
      respond_with(@post_comment, :location => comments_url) do |format|
        format.html do
          if request.xhr?
            render :partial => "comments/show", :locals => { :post_comment => @post_comment }, :layout => false, :status => :created
          else
            redirect_to @post_comment
          end
        end
      end
    else
      respond_with(@post_comment, :location => comments_url)  do |format|
        format.html do
          if request.xhr?
            render :json => @post_comment.errors, :status => :unprocessable_entity
          else
            render :action => :new, :status => :unprocessable_entity
          end
        end
      end
    end
  end


  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @post_comment = PostComment.find(params[:id])

    respond_to do |format|
      if @post_comment.update_attributes(params[:post_comment])
        format.html { redirect_to @post_comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end
end
