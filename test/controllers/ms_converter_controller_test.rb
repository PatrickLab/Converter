require 'test_helper'

class MsConverterControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ms_converter_index_url
    assert_response :success
  end

  test "should get new" do
    get ms_converter_new_url
    assert_response :success
  end

  test "should get create" do
    get ms_converter_create_url
    assert_response :success
  end

  test "should get destroy" do
    get ms_converter_destroy_url
    assert_response :success
  end

end
