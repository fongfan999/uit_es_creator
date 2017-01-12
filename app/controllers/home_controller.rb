class HomeController < ApplicationController
  def index
    if params[:student_id].present? || session[:student_id].present?
      student_id = 
        params[:student_id].try(:dup) || session[:student_id].try(:dup)

      # Store student_id as session
      session[:student_id] = student_id
      # full_name will be the name or student ID
      @full_name = student_id.dup

      # Load datasource
      @datasource = MultiJson.load Rails.root.join('public', 'daa_data.json')

      @class_codes = []
      # Get the classes that belong to this student
      @result = @datasource.map { |data|
        if data.last['students'].include?(student_id)
          # Update full_name for the first name
          if @full_name == student_id
            @full_name = data.last['students'][student_id]['student_name']
          end

          # Get all class codes for displaying relevant notifs
          @class_codes << data.first.sub(/_.+/, '')


          # return mapping data
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
      }.compact.sort_by do |data|
        [ data[:date].last(4), data[:date], data[:shift] ]
      end

      # Load notifs
      @notifs_data = 
        MultiJson.load Rails.root.join('public', 'notifs_data.json')

      # Strike the past exams
      @date_range_to_yesterday = date_range_to_yesterday
      @shift_now = shift_now

      # Shift to time
      @shifts = shifts
    end
  end

  def show_notifs
    head :ok
  end

  def uit_es_creator
    redirect_to root_path
  end
end
