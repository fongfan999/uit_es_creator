class CreateKlasses < ActiveRecord::Migration[5.0]
  def change
    create_table :klasses do |t|
      t.string :name
      t.string :code
      t.string :date
      t.string :day
      t.integer :shift
      t.string :room
      t.integer :sum
      t.string :note

      t.timestamps
    end
  end
end
