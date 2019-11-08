class PreauthorizationsController < ApplicationController
  before_action :set_preauthorization, only: [:update, :destroy]


  # POST /preauthorizations
  # POST /preauthorizations.json
  def create
    @preauthorization = Preauthorization.new(preauthorization_params)

    respond_to do |format|
      if @preauthorization.save
        format.html { redirect_to admin_users_path, notice: 'Preauthorization was successfully created.' }
        format.json { render :show, status: :created, location: @preauthorization }
      else
        format.html { render :new }
        format.json { render json: @preauthorization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /preauthorizations/1
  # PATCH/PUT /preauthorizations/1.json
  def update
    respond_to do |format|
      if @preauthorization.update(preauthorization_params)
        format.html { redirect_to @preauthorization, notice: 'Preauthorization was successfully updated.' }
        format.json { render :show, status: :ok, location: @preauthorization }
      else
        format.html { render :edit }
        format.json { render json: @preauthorization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /preauthorizations/1
  # DELETE /preauthorizations/1.json
  def destroy
    @preauthorization.destroy
    respond_to do |format|
      format.html { redirect_to preauthorizations_url, notice: 'Preauthorization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_preauthorization
      @preauthorization = Preauthorization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def preauthorization_params
      params.require(:preauthorization).permit(
        :email,
        :admin,
        :contributor,
        :fulfilled
      )
    end
end
