class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :admin_only, except: [:index, :show]

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.all
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    case @blog.primary_category
    when "Motivation"
      @related_blogs = Blog.where(motivation: true, published: true).where("published_at < ?", Date.today)
    when "Mindset"
      @related_blogs = Blog.where(mindset: true, published: true).where("published_at < ?", Date.today)
    when "Resourcing"
      @related_blogs = Blog.where(resourcing: true, published: true).where("published_at < ?", Date.today)
    when "Planning"
      @related_blogs = Blog.where(planning: true, published: true).where("published_at < ?", Date.today)
    when "Time Management"
      @related_blogs = Blog.where(time_management: true, published: true).where("published_at < ?", Date.today)
    when "Discipline"
      @related_blogs = Blog.where(discipline: true, published: true).where("published_at < ?", Date.today)
    end
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id

    if params[:blog][:pins].present?
      @blog.pins.purge
      @blog.pins.attach(params[:blog][:pins])
    end

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def admin_only
    unless current_user && current_user.admin
      redirect_back(fallback_location: root_path)
      flash[:warning] = "Sorry, you must be an administrator to access that page."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(
        :title,
        :teaser,
        :body,

        :primary_category,
        :motivation,
        :mindset,
        :resourcing,
        :planning,
        :time_management,
        :discipline,

        :image_url,
        :pinterest_description,

        :published,
        :published_at,
        :featured,
        :approved,

        :resource_id,
        :user_id,

        pins: []
      )
    end
end
