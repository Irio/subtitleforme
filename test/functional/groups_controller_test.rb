require 'test_helper'

class GroupsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success, 'doesnt got successful response'
  end

  test "should get create" do
    groups_before = Group.count
    group_attr = { :name => 'test' }
    post :create, { 'group' => group_attr }

    assert_equal 1, Group.count - groups_before, 'doesnt created a group'

    assert_response :redirect, 'doesnt got successful response'

    assert_redirected_to group_path(assigns(:group)), 'doesnt redicted to group page'

    assert_nothing_raised(ArgumentError) do
      Git.open Repository.folder(assigns(:group))
    end # doesnt created proper git respository

    Repository.delete(:all)
  end

  test "should get show" do
    get :show, { :id => groups(:complete).id }
    assert_response :success, 'doesnt got successful response'
  end

end
