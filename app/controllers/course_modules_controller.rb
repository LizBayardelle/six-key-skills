class CourseModulesController < ApplicationController
  before_action :set_course_module, only: [:show, :edit, :update, :destroy]
  before_action :registered_or_admin, only: [:show]
  before_action :admin_only, only: [:new, :create, :edit, :update, :destroy]

  # GET /course_modules
  # GET /course_modules.json
  def index
    @course_modules = CourseModule.all
  end

  # GET /course_modules/1
  # GET /course_modules/1.json
  def show
    @course = Course.find(@course_module.course_id)
    @this_is_course = @course
    @active_mod_id = @course_module.id

    @lessons = Lesson.where(course_module_id: @course_module.id).order(:sort).all
    array = []
    @course.course_modules.order(:sort).each do |mod|
      array << mod
    end
    @order_in_course = array.index(@course_module) + 1
  end

  # GET /course_modules/new
  def new
    @course_module = CourseModule.new
  end

  # GET /course_modules/1/edit
  def edit
  end

  # POST /course_modules
  # POST /course_modules.json
  def create
    @course_module = CourseModule.new(course_module_params)

    if params[:course_module][:image].present?
      @course_module.image.attach(params[:course_module][:image])
    end

    respond_to do |format|
      if @course_module.save
        format.html { redirect_to @course_module, notice: 'Course module was successfully created.' }
        format.json { render :show, status: :created, location: @course_module }
      else
        format.html { render :new }
        format.json { render json: @course_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_modules/1
  # PATCH/PUT /course_modules/1.json
  def update

    if params[:course_module][:image].present?
      @course_module.image.purge
      @course_module.image.attach(params[:course_module][:image])
    end

    respond_to do |format|
      if @course_module.update(course_module_params)
        format.html { redirect_to @course_module, notice: 'Course module was successfully updated.' }
        format.json { render :show, status: :ok, location: @course_module }
      else
        format.html { render :edit }
        format.json { render json: @course_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_modules/1
  # DELETE /course_modules/1.json
  def destroy
    @course_module.destroy
    respond_to do |format|
      format.html { redirect_to course_modules_url, notice: 'Course module was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_module
      @course_module = CourseModule.find(params[:id])
    end

    def registered_or_admin
      @course_module = CourseModule.find(params[:id])
      @course = @course_module.course
      unless current_user && (current_user.admin || CourseRegistration.where(user_id: current_user.id, course_id: @course.id).count != 0)
        redirect_to courses_path, notice: "Sorry, you do not have access to that course yet."
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_module_params
      params.require(:course_module).permit(
        :title,
        :description,
        :image,
        :video,
        :teaser,
        :goal,
        :course_id,
        :active
      )
    end
end
