class NewsPostsController < ApplicationController
  load_and_authorize_resource
  before_filter :prepare_options, :only => [:new, :edit]

  # GET /news_posts
  # GET /news_posts.json
  def index
    if current_user.try(:has_role?, 'Librarian')
      @news_posts = NewsPost.page(params[:page])
    else
      @news_posts = NewsPost.published.page(params[:page])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @news_posts }
      format.rss  { render :layout => false }
      format.atom
    end
  end

  # GET /news_posts/1
  # GET /news_posts/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @news_post }
    end
  end

  # GET /news_posts/new
  # GET /news_posts/new.json
  def new
    @news_post = NewsPost.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @news_post }
    end
  end

  # GET /news_posts/1/edit
  def edit
  end

  # POST /news_posts
  # POST /news_posts.json
  def create
    @news_post = NewsPost.new(params[:news_post])
    @news_post.user = current_user

    respond_to do |format|
      if @news_post.save
        format.html { redirect_to(@news_post, :notice => t('controller.successfully_created', :model => t('activerecord.models.news_post'))) }
        format.json { render :json => @news_post, :status => :created, :location => @news_post }
      else
        prepare_options
        format.html { render :action => "new" }
        format.json { render :json => @news_post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /news_posts/1
  # PUT /news_posts/1.json
  def update
    if params[:move]
      move_position(@news_post, params[:move])
      return
    end

    respond_to do |format|
      if @news_post.update_attributes(params[:news_post])
        format.html { redirect_to(@news_post, :notice => t('controller.successfully_updated', :model => t('activerecord.models.news_post'))) }
        format.json { head :no_content }
      else
        prepare_options
        format.html { render :action => "edit" }
        format.json { render :json => @news_post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /news_posts/1
  # DELETE /news_posts/1.json
  def destroy
    @news_post.destroy

    respond_to do |format|
      format.html { redirect_to(news_posts_url) }
      format.json { head :no_content }
    end
  end

  def prepare_options
    @roles = Role.all
  end
end
