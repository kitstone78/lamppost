require 'test_helper'

class AdminUsersTest < ActionDispatch::IntegrationTest

def test_create_user
  visit "/admin/users"
  click_on "Add New User"
  fill_in "Username", with: 'Ricky Ricardo'
  fill_in "Email", with: 'test@one.net'
  fill_in "Password", with: '12345678'
  click_on "Create User"
  user_id = User.last.id
  assert page.has_content?("Ricky Ricardo")
  click_on "Edit User"
  fill_in "Email", with: 'rick@ricardo.com'
  assert_equal 'rick@ricardo.com', 'rick@ricardo.com'
  click_on "Update User"
  assert page.has_content?("rick@ricardo")
  click_on "#{user_id}"
  click_on "Delete user"
  page.has_content?("User #{user_id}")
  refute page.has_content?('Ricky Ricardo')
end

end