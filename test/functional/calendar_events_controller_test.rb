require 'test_helper'

class CalendarEventsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:calendar_events)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_calendar_event
    assert_difference('CalendarEvent.count') do
      post :create, :calendar_event => { }
    end

    assert_redirected_to calendar_event_path(assigns(:calendar_event))
  end

  def test_should_show_calendar_event
    get :show, :id => calendar_events(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => calendar_events(:one).id
    assert_response :success
  end

  def test_should_update_calendar_event
    put :update, :id => calendar_events(:one).id, :calendar_event => { }
    assert_redirected_to calendar_event_path(assigns(:calendar_event))
  end

  def test_should_destroy_calendar_event
    assert_difference('CalendarEvent.count', -1) do
      delete :destroy, :id => calendar_events(:one).id
    end

    assert_redirected_to calendar_events_path
  end
end
