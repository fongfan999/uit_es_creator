class Tracker < ApplicationRecord
  CIRCLETIME = 15.minutes

  scope :recent, -> { order(updated_at: :desc).limit(15) }

  def self.track!(student_id)
    tracker = Tracker.find_or_initialize_by(student_id: student_id)

    if tracker.new_record? || (Time.current - tracker.created_at) > CIRCLETIME
      tracker.save
    end

    tracker
  end
end
