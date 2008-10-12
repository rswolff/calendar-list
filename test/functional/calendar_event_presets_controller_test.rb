require 'test_helper'

class CalendarEventPresetsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:calendar_event_presets)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_calendar_event_preset
    assert_difference('CalendarEventPreset.count') do
      post :create, :calendar_event_preset => { }
    end

    assert_redirected_to calendar_event_preset_path(assigns(:calendar_event_preset))
  end

  def test_should_show_calendar_event_preset
    get :show, :id => calendar_event_presets(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => calendar_event_presets(:one).id
    assert_response :success
  end

  def test_should_update_calendar_event_preset
    put :update, :id => calendar_event_presets(:one).id, :calendar_event_preset => { }
    assert_redirected_to calendar_event_preset_path(assigns(:calendar_event_preset))
  end

  def test_should_destroy_calendar_event_preset
    assert_difference('CalendarEventPreset.count', -1) do
      delete :destroy, :id => calendar_event_presets(:one).id
    end

    assert_redirected_to calendar_event_presets_path
  end
end
