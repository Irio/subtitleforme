require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should accept a user with all attributes" do
    assert users(:complete).save
  end

  test "should not accept a user without nick" do
    assert not(users(:without_nick).save)
  end

  test "should not accept a user without email" do
    assert not(users(:without_email).save)
  end

  test "should associate a user" do
    assert not(users(:without_email).save)
  end

  test "should accept a user without group" do
    assert users(:without_group).save
  end
end
