class Klass < ApplicationRecord
  has_many :exam_schedulers
  has_many :students, through: :exam_schedulers
end
