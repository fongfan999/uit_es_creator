class Api::V1::DaaController < Api::V1::ApplicationController
  def uesc
    data = if student = Student.find_by_student_id(params[:student_id])
      { name: student.name, es: student.klasses }
    else
      {}
    end

    respond_to do |format|
      format.json { render json: data }
      format.xml { render xml: data }
    end
  end
end
