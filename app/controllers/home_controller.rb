class HomeController < ApplicationController
  def index
    session[:student_id] = params[:student_id] || session[:student_id]
    @students = JSON.parse File.read(Rails.root.join('public/students.json'))
    
    if @student = @students[session[:student_id]]
      @classes = @student['class_ids']

      Tracker.track(session[:student_id])
    end
    
    # Shift to time
    @shifts = shifts
  end
end
