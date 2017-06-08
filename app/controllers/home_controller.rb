class HomeController < ApplicationController
  before_action :load_shifts, only: :index

  def index
    session[:student_id] = params[:student_id] || session[:student_id]
    @student = Student.find_student(session[:student_id].gsub!(/\D+/, ''))

    unless @student.empty?
      @classes = @student['es']

      Tracker.track(session[:student_id])
    end
  end

  private
    def load_shifts
      @shifts ||= { "1": "7:30", "2": "9:30", "3": "13:30", "4": "15:30" }
    end
end
