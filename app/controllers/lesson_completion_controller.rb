class LessonCompletionController < ApplicationController

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

  def unfavorite_lesson
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_params
      params.require(:lesson).permit(
        :lesson_id,
        :user_id,
        :started,
        :complete,
        :favorite,
      )
    end
end
