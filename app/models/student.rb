class Student < ApplicationRecord
  has_many :exam_schedulers
  has_many :klasses, through: :exam_schedulers
end
