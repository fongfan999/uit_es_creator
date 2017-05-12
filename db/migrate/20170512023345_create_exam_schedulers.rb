class CreateExamSchedulers < ActiveRecord::Migration[5.0]
  def change
    create_table :exam_schedulers do |t|
      t.references :student, foreign_key: true
      t.references :klass, foreign_key: true
    end
  end
end
