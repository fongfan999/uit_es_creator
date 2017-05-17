class Klass < ApplicationRecord
  default_scope { order(:date, :shift) }

  has_many :exam_schedulers
  has_many :students, through: :exam_schedulers
end
