class HomeController < ApplicationController
  def index
    redirect_to uit_es_creator_path
  end

  def uit_es_creator
    if params[:student_id].present?
      student_id = params[:student_id]
      # full_name will be the name or student ID
      @full_name = student_id.dup

      # Load datasource
      @datasource = MultiJson.load Rails.root.join('public', 'daa_data.json')

      # Get the classes that belong to this student
      @result = @datasource.map { |data|
        if data.last['students'].include?(student_id)
          # Update full_name for the first name
          if @full_name == student_id
            @full_name = data.last['students'][student_id]['student_name']
          end

          # return mapping data
          data
        end
      }.compact.sort_by { |class_code, data| [ data['date'], data['day'] ] }


      # Get all class codes
      @class_codes = @result.map { |code| code.first.sub(/_.+/, '') }
      # Load notifs
      @notifs_data = 
      MultiJson.load Rails.root.join('public', 'notifs_data.json')
  end
  end
end
