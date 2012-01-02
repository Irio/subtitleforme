require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  test "should accept a group with name" do
    assert groups(:complete).save
  end

  test "should not accept a group without name" do
    groups(:complete).name = nil
    assert not(groups(:complete).save)
  end

  test "should create a git repository to the group" do
    flunk
  end
end
