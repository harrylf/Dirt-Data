# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

gardens = [{:name => 'UIOWA Garden', :password => 'TESTPASSWORD'}]

gardens.each do |garden|
    Garden.create!(garden)
end
water_readings = [{:node1 => 50, :node2 => 50, :node3 => 50, :node4 => 50, :node5 => 50, :node6 => 50 , :node7 => 50, :node8 => 50, :garden_id => 1}]
water_readings.each do |reading|
    WaterReading.create!(reading)
end
light_readings = [{:node1 => 50, :node2 => 50, :node3 => 50, :node4 => 50, :node5 => 50, :node6 => 50 , :node7 => 50, :node8 => 50, :temp => 50, :garden_id => 1}]
light_readings.each do |reading|
    LightReading.create!(reading)
end