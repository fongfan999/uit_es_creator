class HomeController < ApplicationController
  def index
    student_id = params[:student_id]

    file_path = Rails.root.join('lib', 'uit_daa', 'data.json')
    data = MultiJson.load(file_path)
    @result = data.map {|d| d if d.last['students'].include?(student_id) }.compact.map { |d|
        {
          name: d.last['name'],
          date: d.last['date'],
          day: d.last['day'],
          shift: d.last['shift'],
          room: d.last['room'],
          sum: d.last['sum'],
          student: d.last['students'][student_id]
        }
      }.sort_by! {|r| [r[:date], r[:day]]}
  end
end
