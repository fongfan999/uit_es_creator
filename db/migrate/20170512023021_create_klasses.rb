class CreateKlasses < ActiveRecord::Migration[5.0]
  def change
    create_table :klasses do |t|
      t.string :name
      t.string :code
      t.date :date
      t.day :day
      t.integer :shift
      t.string :room
      t.integer :sum
      t.string :note

      t.timestamps
    end
  end
end
