class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

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
    if LessonCompletion.where(user_id: current_user.id).exists?
      @lesson_completion = LessonCompletion.find(current_user.id)
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
  end

  # GET /lessons/1/edit
  def edit
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

  def complete_lesson
    @lesson_completion = LessonCompletion.find(params[:id])
    if @lesson_completion.update_attributes(complete: true)
        redirect_to course_module_path(CourseModule.find(Lesson.find(@lesson_completion.lesson_id).id))
        flash[:notice] = "Congratulations on completing that lesson!"
    else
        redirect_to lesson_path(Lesson.find(@lesson_completion.lesson_id))
        flash[:warning] = "Oops! Something went wrong!"
    end
  end

  def uncomplete_lesson
    @lesson_completion = LessonCompletion.find(params[:id])
    if @lesson_completion.update_attributes(complete: false)
        redirect_to lesson_path(Lesson.find(@lesson_completion.lesson_id))
        flash[:notice] = "Congratulations on completing that lesson!"
    else
        redirect_to lesson_path(Lesson.find(@lesson_completion.lesson_id))
        flash[:warning] = "Oops! Something went wrong!"
    end
  end

  def favorite_lesson
    @lesson_completion = LessonCompletion.find(params[:id])
    if @lesson_completion.update_attributes(favorite: true)
        redirect_to lesson_path(Lesson.find(@lesson_completion.lesson_id))
        flash[:notice] = "That lesson has been saved to your favorites."
    else
        redirect_to lesson_path(Lesson.find(@lesson_completion.lesson_id))
        flash[:warning] = "Oops! Something went wrong!"
    end
  end

  def uncomplete_lesson
    @lesson_completion = LessonCompletion.find(params[:id])
    if @lesson_completion.update_attributes(favorite: false)
        redirect_to lesson_path(Lesson.find(@lesson_completion.lesson_id))
        flash[:notice] = "That lesson has been removed from your favorites."
    else
        redirect_to lesson_path(Lesson.find(@lesson_completion.lesson_id))
        flash[:warning] = "Oops! Something went wrong!"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_params
      params.require(:lesson).permit(
        :title,
        :teaser,
        :goal,
        :description,
        :body,
        :video,
        :image,
        :course_module_id,
        :active
      )
    end
end
