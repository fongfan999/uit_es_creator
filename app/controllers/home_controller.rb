class HomeController < ApplicationController
  before_action :load_shifts, only: :index

  def index
    session[:student_id] = params[:student_id] || session[:student_id]
    @student = Student.find_student(session[:student_id])

    unless @student.empty?
      @classes = @student['es']

      Tracker.track(session[:student_id])
    end
  end
end
