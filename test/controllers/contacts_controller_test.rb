require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get contacts_view_url
    assert_response :success
  end

end
