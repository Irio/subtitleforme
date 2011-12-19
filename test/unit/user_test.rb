require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should accept a user with all attributes" do
    assert users(:complete).save
  end

  test "should not accept a user withouth nick" do
    assert not(users(:without_nick).save)
  end

  test "should not accept a user withouth email" do
    assert not(users(:without_email).save)
  end
end
