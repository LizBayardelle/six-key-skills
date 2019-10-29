class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]
  before_action :admin_only, except: [:show, :index]
  before_action :subscriber_or_member, only: [:show]

  # GET /resources
  # GET /resources.json
  def index
    @resources = Resource.where(active: true)
    @general = Resource.where(active: true, general: true)
    @motivation = Resource.where(active: true, motivation: true)
    @mindset = Resource.where(active: true, mindset: true)
    @resourcing = Resource.where(active: true, resourcing: true)
    @planning = Resource.where(active: true, planning: true)
    @time_management = Resource.where(active: true, time_management: true)
    @discipline = Resource.where(active: true, discipline: true)
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
  end

  # GET /resources/new
  def new
    @resource = Resource.new
  end

  # GET /resources/1/edit
  def edit
  end

  # POST /resources
  # POST /resources.json
  def create
    @resource = Resource.new(resource_params)
    @resource.user_id = current_user.id
    @resource.document.attach(params[:resource][:document])
    @resource.sample.attach(params[:resource][:sample])

    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: 'Resource was successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resources/1
  # PATCH/PUT /resources/1.json
  def update
    if params[:resource][:document].present?
      @resource.document.purge
      @resource.document.attach(params[:resource][:document])
    end
    if params[:resource][:sample].present?
      @resource.sample.purge
      @resource.sample.attach(params[:resource][:sample])
    end
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to resources_url, notice: 'Resource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def admin_only
    unless current_user && current_user.admin
      redirect_back(fallback_location: root_path)
      flash[:warning] = "Sorry, you must be an administrator to access that page."
    end
  end

  def subscriber_or_member
    unless current_user || Subscriber.where(email: params[:email]).count != 0
      redirect_back(fallback_location: root_path)
      flash[:warning] = "Sorry, you must subscribe or have a site login to see that.  Create a free account for access to our entire resource library."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
      params.require(:resource).permit(
        :title,
        :description,
        :classification,

        :general,
        :motivation,
        :mindset,
        :resourcing,
        :planning,
        :time_management,
        :discipline,

        :resource_type,
        :link_url,
        :document,
        :sample,

        :active,
        :user_id
      )
    end
end
