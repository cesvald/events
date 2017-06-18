require 'test_helper'

class StaysControllerTest < ActionController::TestCase
  setup do
    @stay = stays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stay" do
    assert_difference('Stay.count') do
      post :create, stay: { end_at: @stay.end_at, participant_id: @stay.participant_id, space_id: @stay.space_id, start_at: @stay.start_at }
    end

    assert_redirected_to stay_path(assigns(:stay))
  end

  test "should show stay" do
    get :show, id: @stay
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stay
    assert_response :success
  end

  test "should update stay" do
    patch :update, id: @stay, stay: { end_at: @stay.end_at, participant_id: @stay.participant_id, space_id: @stay.space_id, start_at: @stay.start_at }
    assert_redirected_to stay_path(assigns(:stay))
  end

  test "should destroy stay" do
    assert_difference('Stay.count', -1) do
      delete :destroy, id: @stay
    end

    assert_redirected_to stays_path
  end
end
