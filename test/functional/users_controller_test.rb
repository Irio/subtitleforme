require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success, 'doesnt got success response'
  end

  test "should get create" do
    users_before = User.count
    user_attr = { :nick     => 'test',
                  :password => 'test',
                  :email    => 'test@gmail.com' }
    post :create, { 'user' => user_attr }

    assert_equal 1, User.count - users_before, 'doesnt created a user'

    assert_response :redirect, 'doesnt got success response'

    assert_redirected_to :root, 'doesnt redicted to home'

    assert_nothing_raised(ArgumentError) do
      Git.open Repository.folder(assigns(:user))
    end # doesnt created proper git respository

    Repository.delete(:all)
  end

  test "should get show" do
    assert_response :success, 'doesnt got success response'
    get :show, { :id => users(:complete).id }
    assert_not_nil assigns(:user), 'doesnt assigned user'
  end

end
