class HomeController < ApplicationController
  def index
    redirect_to "http://www.foxfizz.com"
  end

  def uit_es_creator
    file_path = Rails.root.join('lib', 'uit_daa', 'data.json')
    data = MultiJson.load(file_path)
    
    student_id = params[:student_id]

    @result = data.map { |data|
      data if data.last['students'].include?(student_id)
    }.compact.map { |data|
      {
        name: data.last['name'],
        date: data.last['date'],
        day: data.last['day'],
        shift: data.last['shift'],
        room: data.last['room'],
        sum: data.last['sum'],
        student: data.last['students'][student_id]
      }
    }.sort_by! { |r| [r[:date], r[:day]] }
  end
end
