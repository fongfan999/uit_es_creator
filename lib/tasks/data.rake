namespace :es do
  desc "Initialize exam scheduler data"
  task initialize: :environment do
    ExamScheduler.delete_all
    Student.delete_all
    Klass.delete_all

    students = JSON.parse File.read(Rails.root.join('public/students.json'))
    students.each do |student|
      student_id = student.first
      name = student.last['name']

      s = Student.new(student_id: student_id, name: name)
      klass_ids = []
      student.last['class_ids'].each do |klass|
        klass_ids << Klass.find_or_create_by(klass.except('id_number')).id
      end

      s.klass_ids = klass_ids
      s.save
    end
  end
end
