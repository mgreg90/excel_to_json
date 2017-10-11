require 'test_helper'

class ExcelControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get excel_new_url
    assert_response :success
  end

  test "should get show" do
    get excel_show_url
    assert_response :success
  end

  test "should get create" do
    get excel_create_url
    assert_response :success
  end

end
