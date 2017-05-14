class AddIdNumberToExamSchedulers < ActiveRecord::Migration[5.0]
  def change
    add_column :exam_schedulers, :id_number, :integer
  end
end
