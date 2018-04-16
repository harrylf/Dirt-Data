require 'test_helper'

class WaterReadingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @water_reading = water_readings(:one)
  end

  test "should get index" do
    get water_readings_url
    assert_response :success
  end

  test "should get new" do
    get new_water_reading_url
    assert_response :success
  end

  test "should create water_reading" do
    assert_difference('WaterReading.count') do
      post water_readings_url, params: { water_reading: { node1: @water_reading.node1, node2: @water_reading.node2, node3: @water_reading.node3, node4: @water_reading.node4, node5: @water_reading.node5, node6: @water_reading.node6, node7: @water_reading.node7, node8: @water_reading.node8 } }
    end

    assert_redirected_to water_reading_url(WaterReading.last)
  end

  test "should show water_reading" do
    get water_reading_url(@water_reading)
    assert_response :success
  end

  test "should get edit" do
    get edit_water_reading_url(@water_reading)
    assert_response :success
  end

  test "should update water_reading" do
    patch water_reading_url(@water_reading), params: { water_reading: { node1: @water_reading.node1, node2: @water_reading.node2, node3: @water_reading.node3, node4: @water_reading.node4, node5: @water_reading.node5, node6: @water_reading.node6, node7: @water_reading.node7, node8: @water_reading.node8 } }
    assert_redirected_to water_reading_url(@water_reading)
  end

  test "should destroy water_reading" do
    assert_difference('WaterReading.count', -1) do
      delete water_reading_url(@water_reading)
    end

    assert_redirected_to water_readings_url
  end
end
