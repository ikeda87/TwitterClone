require 'test_helper'

class ToukousControllerTest < ActionDispatch::IntegrationTest
  setup do
    @toukou = toukous(:one)
  end

  test "should get index" do
    get toukous_url
    assert_response :success
  end

  test "should get new" do
    get new_toukou_url
    assert_response :success
  end

  test "should create toukou" do
    assert_difference('Toukou.count') do
      post toukous_url, params: { toukou: { content: @toukou.content } }
    end

    assert_redirected_to toukou_url(Toukou.last)
  end

  test "should show toukou" do
    get toukou_url(@toukou)
    assert_response :success
  end

  test "should get edit" do
    get edit_toukou_url(@toukou)
    assert_response :success
  end

  test "should update toukou" do
    patch toukou_url(@toukou), params: { toukou: { content: @toukou.content } }
    assert_redirected_to toukou_url(@toukou)
  end

  test "should destroy toukou" do
    assert_difference('Toukou.count', -1) do
      delete toukou_url(@toukou)
    end

    assert_redirected_to toukous_url
  end
end
