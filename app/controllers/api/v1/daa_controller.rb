class Api::V1::DaaController < Api::V1::ApplicationController
  def uesc
    student = Student.find_by_student_id(params[:student_id])

    respond_to do |format|
      format.json { render json: student }
    end
  end
end
