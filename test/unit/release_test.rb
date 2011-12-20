require 'test_helper'

class ReleaseTest < ActiveSupport::TestCase
  test "should accept a release with name" do
    assert releases(:the_shining).save
  end

  test "should not accept a release without name" do
    assert not(releases(:without_name).save)
  end

  test "should not accept a release without video" do
    assert not(releases(:without_video).save)
  end
end
