require 'test_helper'

class AirTicketsControllerTest < ActionController::TestCase
  setup do
    @air_ticket = air_tickets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:air_tickets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create air_ticket" do
    assert_difference('AirTicket.count') do
      post :create, air_ticket: { arrive_at: @air_ticket.arrive_at, arrive_to: @air_ticket.arrive_to, estimated_at: @air_ticket.estimated_at, leave_at: @air_ticket.leave_at, leave_from: @air_ticket.leave_from, participant_id: @air_ticket.participant_id }
    end

    assert_redirected_to air_ticket_path(assigns(:air_ticket))
  end

  test "should show air_ticket" do
    get :show, id: @air_ticket
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @air_ticket
    assert_response :success
  end

  test "should update air_ticket" do
    patch :update, id: @air_ticket, air_ticket: { arrive_at: @air_ticket.arrive_at, arrive_to: @air_ticket.arrive_to, estimated_at: @air_ticket.estimated_at, leave_at: @air_ticket.leave_at, leave_from: @air_ticket.leave_from, participant_id: @air_ticket.participant_id }
    assert_redirected_to air_ticket_path(assigns(:air_ticket))
  end

  test "should destroy air_ticket" do
    assert_difference('AirTicket.count', -1) do
      delete :destroy, id: @air_ticket
    end

    assert_redirected_to air_tickets_path
  end
end
