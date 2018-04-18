require 'test_helper'

class LightReadingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @light_reading = light_readings(:one)
  end

  test "should get index" do
    get light_readings_url
    assert_response :success
  end

  test "should get new" do
    get new_light_reading_url
    assert_response :success
  end

  test "should create light_reading" do
    assert_difference('LightReading.count') do
      post light_readings_url, params: { light_reading: { garden_id: @light_reading.garden_id, node1: @light_reading.node1, node2: @light_reading.node2, node3: @light_reading.node3, node4: @light_reading.node4, node5: @light_reading.node5, node6: @light_reading.node6, node7: @light_reading.node7, node8: @light_reading.node8, temp: @light_reading.temp } }
    end

    assert_redirected_to light_reading_url(LightReading.last)
  end

  test "should show light_reading" do
    get light_reading_url(@light_reading)
    assert_response :success
  end

  test "should get edit" do
    get edit_light_reading_url(@light_reading)
    assert_response :success
  end

  test "should update light_reading" do
    patch light_reading_url(@light_reading), params: { light_reading: { garden_id: @light_reading.garden_id, node1: @light_reading.node1, node2: @light_reading.node2, node3: @light_reading.node3, node4: @light_reading.node4, node5: @light_reading.node5, node6: @light_reading.node6, node7: @light_reading.node7, node8: @light_reading.node8, temp: @light_reading.temp } }
    assert_redirected_to light_reading_url(@light_reading)
  end

  test "should destroy light_reading" do
    assert_difference('LightReading.count', -1) do
      delete light_reading_url(@light_reading)
    end

    assert_redirected_to light_readings_url
  end
end
