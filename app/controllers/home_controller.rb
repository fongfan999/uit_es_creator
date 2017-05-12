class HomeController < ApplicationController
  def index
    session[:student_id] = params[:student_id] || session[:student_id]
    @student = Student.find_student(session[:student_id])

    unless @student.empty?
      @classes = @student['es']

      Tracker.track(session[:student_id])
    end

    # Shift to time
    @shifts = shifts
  end
end
