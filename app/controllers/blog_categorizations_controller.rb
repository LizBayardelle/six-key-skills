class BlogCategorizationsController < ApplicationController
  before_action :set_blog_categorization, only: [:show, :edit, :update, :destroy]

  # GET /subcategories
  # GET /subcategories.json
  def index
    @subcategories = BlogCategorization.all
  end

  # GET /subcategories/1
  # GET /subcategories/1.json
  def show
  end

  # GET /subcategories/new
  def new
    @blog_categorization = BlogCategorization.new
  end

  # GET /subcategories/1/edit
  def edit
  end

  # POST /subcategories
  # POST /subcategories.json
  def create
    @blog_categorization = BlogCategorization.new(blog_categorization_params)

    respond_to do |format|
      if @blog_categorization.save
        format.html { redirect_to @blog_categorization, notice: 'Blog subcategorization was successfully created.' }
        format.json { render :show, status: :created, location: @blog_categorization }
      else
        format.html { render :new }
        format.json { render json: @blog_categorization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subcategories/1
  # PATCH/PUT /subcategories/1.json
  def update
    respond_to do |format|
      if @blog_categorization.update(blog_categorization_params)
        format.html { redirect_to @blog_categorization, notice: 'Blog subcategorization was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog_categorization }
      else
        format.html { render :edit }
        format.json { render json: @blog_categorization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subcategories/1
  # DELETE /subcategories/1.json
  def destroy
    @blog_categorization.destroy
    respond_to do |format|
      format.html { redirect_to subcategories_url, notice: 'Blog subcategorization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog_categorization
      @blog_categorization = BlogCategorization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_categorization_params
      params.require(:blog_categorization).permit(
        :blog_id,
        :subcategory_id
      )
    end
end
