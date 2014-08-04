require 'test_helper'

class UsersControllerTest < ActionController::TestCase
   def test_new
    get :new
    assert_response :success
    assert_select "form[action=/users]"
  assert_select "input[name='user[email]']"
  assert_select "input[type=submit][value=Create User]"
  end

  def test_create
  assert_difference 'User.count' do
    post :create, user: { username: 'TestThomas', email: 'test@example.com', password: 'password' }
  end
  user = User.last
  assert_equal 'test@example.com', user.email
  assert_redirected_to user_path(user)
  assert_equal 'User was successfully created.',
    flash[:notice]
  end 
end

  #setup do
    #@user = users(:one)
  #end

  #test "should get index" do
    #get :index
    #assert_response :success
    #assert_not_nil assigns(:users)
  #end

  #test "should get new" do
   # get :new
   # assert_response :success
  #end

  #test "should create user" do
    #assert_difference('User.count') do
    #  post :create, user: { email: @user.email, password: @user.password, username: @user.username }
    #end

  #  assert_redirected_to user_path(assigns(:user))
  #end

  #test "should show user" do
   # get :show, id: @user
   # assert_response :success
  #end

  #test "should get edit" do
  #  get :edit, id: @user
  #  assert_response :success
  #end

 # test "should update user" do
 #   patch :update, id: @user, user: { email: @user.email, password: @user.password, username: @user.username }
  #  assert_redirected_to user_path(assigns(:user))
  #end

  #SCF I don't think we need this, since only Admins can delete users.
  # test "should destroy user" do
  #   assert_difference('User.count', -1) do
  #     delete :destroy, id: @user
  #   end

  #   assert_redirected_to users_path
  # end
#end
