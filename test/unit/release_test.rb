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

  test "should accept two releases with the same name" do
    releases(:the_shining).save
    with_name_chosen      = releases(:titanic)
    with_name_chosen.name = releases(:the_shining).name
    assert with_name_chosen.save
  end
end
