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
    subtitles(:complete).group = nil
    assert subtitles(:complete).save
  end

  test "should not accept a subtitle without user" do
    subtitles(:complete).user = nil
    assert not(subtitles(:complete).save)
  end

  test "should not accept a subtitle without release" do
    subtitles(:complete).release = nil
    assert not(subtitles(:complete).save)
  end
end
