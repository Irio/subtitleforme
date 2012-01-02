require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should accept a user with all attributes" do
    assert users(:complete).save
  end

  test "should not accept a user without nick" do
    users(:complete).nick = nil
    assert not(users(:complete).save)
  end

  test "should not accept a user without email" do
    users(:complete).email = nil
    assert not(users(:complete).save)
  end

  test "should not accept a user without password" do
    users(:complete).password = nil
    assert_raise ArgumentError do
      users(:complete).save
    end
  end

  test "should accept a user without group" do
    users(:complete).group = nil
    assert users(:complete).save
  end

  test "should encrypt his password with md5" do
    user = users(:complete)
    user.save
    assert_equal '476917cf3c5e4dfa272ab61ffadbab1f', user.password # pele with md5
  end

  test "should not accept a invalid email" do
    users(:complete).email = 'qweqwe@qwe'
    assert not(users(:complete).save)
  end

  test "should not accept two users with the same nick" do
    with_nick_chosen      = users(:complete_2)
    with_nick_chosen.nick = users(:complete).nick
    assert not(with_nick_chosen.save)
  end

  test "should not accept two users with the same email" do
    with_email_chosen       = users(:complete_2)
    with_email_chosen.email = users(:complete).email
    assert not(with_email_chosen.save)
  end
end
