class CreateReadings < ActiveRecord::Migration[5.1]
  def change
    create_table :readings do |t|
      t.datetime :time
      t.string :moisture
      t.string :light

      t.timestamps
    end
  end
end
