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

  test "should not accept a user without password" do
    assert_raise ArgumentError do
      users(:without_password).save
    end
  end

  test "should accept a user without group" do
    assert users(:without_group).save
  end

  test "should encrypt his password with md5" do
    user = users(:complete)
    user.save
    assert_equal '476917cf3c5e4dfa272ab61ffadbab1f', user.password # pele with md5
  end

  test "should not accept a invalid email" do
    user       = users(:complete)
    user.email = 'qweqwe@qwe'
    assert not(user.save)
  end

  test "should not two users with the same nick" do
    users(:complete).save
    with_nick_chosen      = users(:complete_2)
    with_nick_chosen.nick = users(:complete).nick
    assert not(with_nick_chosen.save)
  end

  test "should not two users with the same email" do
    users(:complete).save
    with_email_chosen       = users(:complete_2)
    with_email_chosen.email = users(:complete).email
    assert not(with_email_chosen.save)
  end
end
