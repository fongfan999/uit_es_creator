class ChangeColumnDateFromKlasses < ActiveRecord::Migration[5.0]
  def up
    change_column :klasses, :date, :date
  end

  def down
    change_column :klasses, :date, :string
  end
end
