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

  test "should encrypt his password with md5" do
    assert_equal '476917cf3c5e4dfa272ab61ffadbab1f', users(:complete).password # pele with md5
  end

  test "should not accept a invalid email" do
    user = users(:complete)
    user.email = 'qweqwe@qwe'
    assert not(user.save)
  end
end
