require 'net/http'

class Student < ApplicationRecord
  has_many :exam_schedulers
  has_many :klasses, through: :exam_schedulers

  def as_json(options = {})
    { name: name, es: klasses_with_id_number }
  end

  private
    def klasses_with_id_number
      exam_schedulers
        .includes(:klass)
        .order('klasses.date ASC, klasses.shift ASC').map do |es|
          es.klass.attributes.except('created_at', 'updated_at')
            .merge({id_number: es.id_number})
      end
    end
end
