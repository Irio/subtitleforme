require 'test_helper'

class ReleaseTest < ActiveSupport::TestCase
  test "should accept a release with name" do
    videos(:the_shining).save
    assert releases(:the_shining).save
  end

  test "should not accept a release without name" do
    releases(:the_shining).name = nil
    assert not(releases(:the_shining).save)
  end

  test "should not accept a release without video" do
    releases(:the_shining).video = nil
    assert not(releases(:the_shining).save)
  end

  test "should accept two releases with the same name" do
    with_name_chosen      = releases(:titanic)
    with_name_chosen.name = releases(:the_shining).name
    assert with_name_chosen.save
  end
end
