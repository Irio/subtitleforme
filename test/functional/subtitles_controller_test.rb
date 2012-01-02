require 'test_helper'

class SubtitlesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success, 'doesnt got successful response'
    assert_not_nil assigns(:last_subtitles), 'doesnt assigned last_subtitles'
  end

end
