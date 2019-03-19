require 'test_helper'

class BasicPagesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @base_title = "Service Ordering System"
  end

  test "should get root" do
   get root_path
   assert_response :success
   assert_select "title", "Home | #{@base_title}"
 end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end


end
