class Tracker < ApplicationRecord
  validates :student_id, uniqueness: true

  scope :recent, -> { order(updated_at: :desc).limit(15) }

  def self.track(student_id)
    tracker = Tracker.find_or_initialize_by(student_id: student_id)

    if tracker.new_record?
      tracker.save
    else
      tracker.touch if (Time.current - tracker.updated_at) > 15.minutes
    end
  end
end
