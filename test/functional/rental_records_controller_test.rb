require 'test_helper'

class RentalRecordsControllerTest < ActionController::TestCase
  setup do
    @rental_record = rental_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rental_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rental_record" do
    assert_difference('RentalRecord.count') do
      post :create, rental_record: { device_id: @rental_record.device_id, email: @rental_record.email, end: @rental_record.end, renter: @rental_record.renter, total_time: @rental_record.total_time }
    end

    assert_redirected_to rental_record_path(assigns(:rental_record))
  end

  test "should show rental_record" do
    get :show, id: @rental_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rental_record
    assert_response :success
  end

  test "should update rental_record" do
    put :update, id: @rental_record, rental_record: { device_id: @rental_record.device_id, email: @rental_record.email, end: @rental_record.end, renter: @rental_record.renter, total_time: @rental_record.total_time }
    assert_redirected_to rental_record_path(assigns(:rental_record))
  end

  test "should destroy rental_record" do
    assert_difference('RentalRecord.count', -1) do
      delete :destroy, id: @rental_record
    end

    assert_redirected_to rental_records_path
  end
end
