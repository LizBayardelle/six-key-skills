class LeadMagnetsController < ApplicationController
  before_action :set_lead_magnet, only: [:show, :edit, :update, :destroy]

  # GET /lead_magnets
  # GET /lead_magnets.json
  def index
    @lead_magnets = LeadMagnet.all
  end

  # GET /lead_magnets/1
  # GET /lead_magnets/1.json
  def show
  end

  # GET /lead_magnets/new
  def new
    @lead_magnet = LeadMagnet.new
  end

  # GET /lead_magnets/1/edit
  def edit
  end

  # POST /lead_magnets
  # POST /lead_magnets.json
  def create
    @lead_magnet = LeadMagnet.new(lead_magnet_params)
    @lead_magnet.user_id = current_user.id

    respond_to do |format|
      if @lead_magnet.save
        format.html { redirect_to @lead_magnet, notice: 'Lead magnet was successfully created.' }
        format.json { render :show, status: :created, location: @lead_magnet }
      else
        format.html { render :new }
        format.json { render json: @lead_magnet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lead_magnets/1
  # PATCH/PUT /lead_magnets/1.json
  def update
    respond_to do |format|
      if @lead_magnet.update(lead_magnet_params)
        format.html { redirect_to @lead_magnet, notice: 'Lead magnet was successfully updated.' }
        format.json { render :show, status: :ok, location: @lead_magnet }
      else
        format.html { render :edit }
        format.json { render json: @lead_magnet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lead_magnets/1
  # DELETE /lead_magnets/1.json
  def destroy
    @lead_magnet.destroy
    respond_to do |format|
      format.html { redirect_to lead_magnets_url, notice: 'Lead magnet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead_magnet
      @lead_magnet = LeadMagnet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lead_magnet_params
      params.require(:lead_magnet).permit(
        :title,
        :description,
        :sample,

        :motivation,
        :mindset,
        :resourcing,
        :planning,
        :time_management,
        :discipline,

        :lead_magnet_type,
        :document,
        :link_url,
        
        :active,
        :user_id
      )
    end
end
