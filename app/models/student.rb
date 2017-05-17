require 'net/http'

class Student < ApplicationRecord
  API_URL = 'http://188.166.237.215:37209/api/v1/daa/uesc.json'
  has_many :exam_schedulers
  has_many :klasses, through: :exam_schedulers

  def self.find_student(student_id)
    JSON.parse Net::HTTP.get URI.parse(API_URL + "?student_id=#{student_id}")
  rescue JSON::ParserError
    {}
  end

  def as_json(options = {})
    { name: name, es: klasses_with_id_number }
  end

  private
    def klasses_with_id_number
      ExamScheduler.includes(:klass).where('student_id = ?', self.id)
        .order('klasses.date ASC, klasses.shift ASC').map do |es|
        es.klass.attributes.except('created_at', 'updated_at')
          .merge({id_number: es.id_number})
      end
    end
end
