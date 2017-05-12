class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :student_id
      t.string :name

      t.timestamps
    end
    add_index :students, :student_id
  end
end
