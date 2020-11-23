class SittingsController < ApplicationController
  before_action :set_sitting, only: [:show, :edit, :update, :destroy]

  # GET /sittings
  # GET /sittings.json
  def index
    @sittings = Sitting.all
  end

  # GET /sittings/1
  # GET /sittings/1.json
  def show
    @array_of_labels = []
    @array_of_values = []
    n = 0
    lowest = 100
    @sitting.compile_percentages.each do |x|
      @array_of_labels << x[0].to_s
      @array_of_values << (x[1] * 100 )
      if x[1] <= lowest && Subcategory.where(name: x[0].to_s).count != 0
        @lowest_subcategory = Subcategory.where(name: x[0].to_s).first
      end
    end
  end

  # GET /sittings/new
  def new
    @sitting = Sitting.new
  end

  # GET /sittings/1/edit
  def edit
  end

  # POST /sittings
  # POST /sittings.json
  def create
    @sitting = Sitting.new(sitting_params)

    respond_to do |format|
      if @sitting.save
        format.html { redirect_to @sitting, notice: 'Sitting was successfully created.' }
        format.json { render :show, status: :created, location: @sitting }
      else
        format.html { render :new }
        format.json { render json: @sitting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sittings/1
  # PATCH/PUT /sittings/1.json
  def update
    respond_to do |format|
      if @sitting.update(sitting_params)
        format.html { redirect_to @sitting, notice: 'Sitting was successfully updated.' }
        format.json { render :show, status: :ok, location: @sitting }
      else
        format.html { render :edit }
        format.json { render json: @sitting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sittings/1
  # DELETE /sittings/1.json
  def destroy
    @sitting.destroy
    respond_to do |format|
      format.html { redirect_to sittings_url, notice: 'Sitting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sitting
      @sitting = Sitting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sitting_params
      params.require(:sitting).permit(
        :user_id,
        :quiz_id,
        :results,
        :possible_results,
        compiled_results: [],
        possible_compiled_results: [],
        compiled_percentages: []
      )
    end
end
