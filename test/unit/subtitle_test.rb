require 'test_helper'

class SubtitleTest < ActiveSupport::TestCase
  test "should accept a subtitle with all attributes" do
    groups(:complete).save
    users(:complete).save
    videos(:the_shining).save
    releases(:the_shining).save
    assert subtitles(:complete).save
  end

  test "should accept a subtitle without group" do
    assert subtitles(:without_group).save
  end

  test "should not accept a subtitle without user" do
    assert not(subtitles(:without_user).save)
  end

  test "should not accept a subtitle without release" do
    assert not(subtitles(:without_release).save)
  end
end
