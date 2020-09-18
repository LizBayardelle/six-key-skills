class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  before_action :registered_or_admin, only: [:show]
  before_action :admin_only, only: [:new, :create, :edit, :update, :destroy]

  # GET /lessons
  # GET /lessons.json
  def index
    @lessons = Lesson.all
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
    @course_module = @lesson.course_module
    @course = @course_module.course
    @this_is_course = @course

    if LessonCompletion.where(user_id: current_user.id).exists?
      @lesson_completion = LessonCompletion.where(user_id: current_user.id).last
    else
      @lesson_completion = LessonCompletion.new(user_id: current_user.id, lesson_id: @lesson.id, started: true)
      @lesson_completion.save!
    end
    lesson_array = []
    Lesson.where(course_module_id: @lesson.course_module_id).order(:sort).each do |lesson|
      lesson_array << lesson
    end
    @order_in_module = lesson_array.index(@lesson) + 1
  end

  # GET /lessons/new
  def new
    @lesson = Lesson.new
    @other_lessons = Lesson.where(course_module_id: @lesson.course_module_id)
    if @other_lessons.where.not(order_in_module: nil).count != 0
      @last_lesson_number = @other_lessons.where.not(order_in_module: nil).order("order_in_module DESC").first.order_in_module
    else
      @last_lesson_number = 0
    end
  end

  # GET /lessons/1/edit
  def edit
    @other_lessons = Lesson.where(course_module_id: @lesson.course_module_id)
    if @other_lessons.where.not(order_in_module: nil).count != 0
      @last_lesson_number = @other_lessons.where.not(order_in_module: nil).order("order_in_module DESC").first.order_in_module
    else
      @last_lesson_number = 0
    end
  end

  # POST /lessons
  # POST /lessons.json
  def create
    @lesson = Lesson.new(lesson_params)

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to @lesson, notice: 'Lesson was successfully created.' }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1
  # PATCH/PUT /lessons/1.json
  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to @lesson, notice: 'Lesson was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to lessons_url, notice: 'Lesson was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    def registered_or_admin
      @course_module = @lesson.course_module
      @course = @course_module.course
      unless current_user && (current_user.admin || CourseRegistration.where(user_id: current_user.id, course_id: @course.id).count != 0)
        redirect_to courses_path, notice: "Sorry, you do not have access to that course yet."
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_params
      params.require(:lesson).permit(
        :order_in_module,
        :title,
        :teaser,
        :goal,
        :description,
        :body,

        :video,
        :image,

        :materials,
        :assignment,
        :attachment_name,
        :attachment,

        :course_module_id,
        :active
      )
    end
end
