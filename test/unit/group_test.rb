require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  test "should accept a group with name" do
    assert groups(:complete).save
  end

  test "should not accept a group without name" do
    assert not(groups(:without_name).save)
  end
end
