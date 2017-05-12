require 'httparty'

class Student < ApplicationRecord
  API_URL = 'http://188.166.237.215:37209/api/v1/daa/uesc.json'
  has_many :exam_schedulers
  has_many :klasses, through: :exam_schedulers

  def self.find_student(student_id)
    JSON.parse HTTParty.get(API_URL + "?student_id=#{student_id}").body
  end
end
