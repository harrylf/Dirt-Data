class CreateWaterReadings < ActiveRecord::Migration[5.1]
  def change
    create_table :water_readings do |t|
      t.integer :node1
      t.integer :node2
      t.integer :node3
      t.integer :node4
      t.integer :node5
      t.integer :node6
      t.integer :node7
      t.integer :node8
      t.integer :garden_id

      t.timestamps
    end
  end
end
