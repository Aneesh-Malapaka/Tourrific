require "test_helper"

class DestinationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @destination = destinations(:one)
  end

  test "should get index" do
    get destinations_url
    assert_response :success
  end

  test "should get new" do
    get new_destination_url
    assert_response :success
  end

  test "should create destination" do
    assert_difference("Destination.count") do
      post destinations_url, params: { destination: { dest_name: @destination.dest_name, location: @destination.location, main_photo: @destination.main_photo, rating: @destination.rating, tour_company_id: @destination.tour_company_id } }
    end

    assert_redirected_to destination_url(Destination.last)
  end

  test "should show destination" do
    get destination_url(@destination)
    assert_response :success
  end

  test "should get edit" do
    get edit_destination_url(@destination)
    assert_response :success
  end

  test "should update destination" do
    patch destination_url(@destination), params: { destination: { dest_name: @destination.dest_name, location: @destination.location, main_photo: @destination.main_photo, rating: @destination.rating, tour_company_id: @destination.tour_company_id } }
    assert_redirected_to destination_url(@destination)
  end

  test "should destroy destination" do
    assert_difference("Destination.count", -1) do
      delete destination_url(@destination)
    end

    assert_redirected_to destinations_url
  end
end
