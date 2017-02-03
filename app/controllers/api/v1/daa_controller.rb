class Api::V1::DaaController < Api::V1::ApplicationController
  def uesc
    file_path = Rails.root.join('public', 'daa_data.json')
    @datasource = MultiJson.load(file_path)

    student_id = params[:student_id]
    full_name = student_id.try(:dup) 

    # Get the classes that belong to this student
    result = @datasource.map { |data|
      if data.last['students'].include?(student_id)
        # Update full_name for the first name
        if full_name == student_id
          full_name = data.last['students'][student_id]['student_name']
        end

        {
          class_code: data.first.sub(/_.+/, ''),
          name: data.last['name'],
          date: data.last['date'],
          day: data.last['day'],
          shift: data.last['shift'],
          room: data.last['room'],
          sum: data.last['sum'],
          id_number: data.last['students'][student_id]['id_number'],
          note: data.last['students'][student_id]['note']
        }
      end
    }.compact
    
    f_result = {}.tap do |h|
      h[:student_name] = full_name
      h[:es] = result
    end

    respond_to do |format|
      format.json { render json: f_result }
      format.xml { render xml: f_result }
    end
  end
end
