class Api::V1::DaaController < Api::V1::ApplicationController
  def uesc
    if student = Student.find_by_student_id(params[:student_id]) || {}
      result = {
        name: student.name,
        es: student.klasses
      }
    end

    respond_to do |format|
      format.json { render json: result }
      format.xml { render xml: result }
    end
  end
end
