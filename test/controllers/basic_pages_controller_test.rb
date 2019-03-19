require 'test_helper'

class BasicPagesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should get home" do
   get basic_pages_home_url
   assert_response :success
 end

  test "should get about" do
    get basic_pages_about_url
    assert_response :success
  end

  test "should get contact" do
    get basic_pages_contact_url
    assert_response :success
  end


end
