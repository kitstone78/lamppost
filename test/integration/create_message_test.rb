require 'test_helper'

class CreateMessageTest < ActionDispatch::IntegrationTest

    def test_create_message
      visit "/messages"
      click_link("New")
      fill_in 'User', :with => '2'
      fill_in 'Text', :with => 'This is an Integration Test Message'
      click_on "Create Message"
      #TODO
      #assert page.has_content?('Message was successfully created.')
      assert_equal 'This is an Integration Test Message', Message.last.text
      click_on 'Edit'
      fill_in 'Text', :with => 'Updated Integration Test Message.'
      click_on "Update Message"
      #TODO
      #assert page.has_content?('Message was successfully updated.')
      assert_equal 'Updated Integration Test Message.', Message.last.text
    end
  end