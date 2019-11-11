class SubscribersController < ApplicationController
  before_action :set_subscriber, only: [:show, :edit, :update, :destroy]
  before_action :admin_only, only: [:destroy]

  # GET /subscribers
  # GET /subscribers.json
  def index
    @subscribers = Subscriber.order("created_at DESC")
  end

  # GET /subscribers/1
  # GET /subscribers/1.json
  def show
  end

  # GET /subscribers/new
  def new
    @subscriber = Subscriber.new
  end

  # GET /subscribers/1/edit
  def edit
  end

  # POST /subscribers
  # POST /subscribers.json
  def create
    @subscriber = Subscriber.new(subscriber_params)
    existing = Subscriber.where(email: @subscriber.email).first

    if existing
      existing.resource_id_array << params[:resource_id]
      existing.save
      redirect_to resource_path(params[:resource_id], email: @subscriber.email)
    else
      @subscriber.resource_id_array << params[:resource_id]
      respond_to do |format|
        if @subscriber.save
          format.html { redirect_to resource_path(@subscriber.resource_id_array.last(), email: @subscriber.email) }
          format.json { render :show, status: :created, location: @subscriber }
        else
          format.html { render :new }
          format.json { render json: @subscriber.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /subscribers/1
  # PATCH/PUT /subscribers/1.json
  def update
    respond_to do |format|
      if @subscriber.update(subscriber_params)
        format.html { redirect_to @subscriber, notice: 'Subscriber was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscriber }
      else
        format.html { render :edit }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscribers/1
  # DELETE /subscribers/1.json
  def destroy
    @subscriber.destroy
    respond_to do |format|
      format.html { redirect_to subscribers_url, notice: 'Subscriber was successfully destroyed.' }
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
    def set_subscriber
      @subscriber = Subscriber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscriber_params
      params.require(:subscriber).permit(
        :first_name,
        :email,
        :member,
        :unsubscribed,
        resource_id_array: []
      )
    end
end
