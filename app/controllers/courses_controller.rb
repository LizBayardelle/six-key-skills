class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course_modules = CourseModule.where(course_id: @course.id).order("sort").all
    if current_user && CourseRegistration.where(course_id: @course.id, user_id: current_user.id).count != 0
      @registered = true
    elsif current_user && current_user.admin
      @registered = false
    end
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    @course.user = current_user

    if params[:course][:image].present?
      @course.image.attach(params[:course][:image])
    end

    if params[:course][:pins].present?
      @course.pins.attach(params[:course][:pins])
    end

    if params[:course][:sp1_image].present?
      @course.sp1_image.attach(params[:course][:sp1_image])
    end

    if params[:course][:sp2_image].present?
      @course.sp2_image.attach(params[:course][:sp2_image])
    end

    if params[:course][:sp3_image].present?
      @course.sp3_image.attach(params[:course][:sp3_image])
    end

    respond_to do |format|
      if @course.save
        format.html { redirect_to admin_courses_path, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update

    if params[:course][:image].present?
      @course.image.purge
      @course.image.attach(params[:course][:image])
    end

    if params[:course][:pins].present?
      @course.pins.purge
      @course.pins.attach(params[:course][:pins])
    end

    if params[:course][:sp1_image].present?
      @course.sp1_image.attach(params[:course][:sp1_image])
    end

    if params[:course][:sp2_image].present?
      @course.sp2_image.attach(params[:course][:sp2_image])
    end

    if params[:course][:sp3_image].present?
      @course.sp3_image.attach(params[:course][:sp3_image])
    end

    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to admin_courses_path, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(
        :name,
        :price,
        :active,
        :user_id,

        :teaser,
        :description,
        :reviews,
        :sp1,
        :sp2,
        :sp3,

        :motivation,
        :mindset,
        :resourcing,
        :planning,
        :time_management,
        :discipline,

        :pinterest_description,
        :featured,

        :image,
        :sp1_image,
        :sp2_image,
        :sp3_image,
        pins: []



      )
    end
end
