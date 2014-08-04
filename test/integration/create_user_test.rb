require 'test_helper'

class CreateUserTest < ActionDispatch::IntegrationTest

    def test_create_user
      visit "/users"
      click_link("New")
      fill_in 'Email', :with => 'integration@test.com'
      fill_in 'Password', :with => 'Password123'
      fill_in 'Username', :with => 'IntegrationTestUser'
      click_on "Create User"
      #TODO
      #assert page.has_content?('Message was successfully created.')
      assert_equal 'IntegrationTestUser', User.last.username
      click_on 'Edit'
      fill_in 'Text', :with => 'UpdatedIntegrationTestUser'
      click_on "Update User"
      #TODO
      #assert page.has_content?('Message was successfully updated.')
      assert_equal 'UpdatedIntegrationTestUser', User.last.username 
    end
  end