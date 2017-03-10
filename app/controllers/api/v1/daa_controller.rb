class Api::V1::DaaController < Api::V1::ApplicationController
  def uesc
    @students = JSON.parse File.read(Rails.root.join('public/students.json'))
    
    if student = @students[params[:student_id]] || {}
      result = {
        name: student['name'],
        es: student['class_ids']
      }
    end

    respond_to do |format|
      format.json { render json: result }
      format.xml { render xml: result }
    end
  end
end
