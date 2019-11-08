require 'test_helper'

class PreauthorizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @preauthorization = preauthorizations(:one)
  end

  test "should get index" do
    get preauthorizations_url
    assert_response :success
  end

  test "should get new" do
    get new_preauthorization_url
    assert_response :success
  end

  test "should create preauthorization" do
    assert_difference('Preauthorization.count') do
      post preauthorizations_url, params: { preauthorization: { admin: @preauthorization.admin, contributor: @preauthorization.contributor, email: @preauthorization.email, fulfilled: @preauthorization.fulfilled } }
    end

    assert_redirected_to preauthorization_url(Preauthorization.last)
  end

  test "should show preauthorization" do
    get preauthorization_url(@preauthorization)
    assert_response :success
  end

  test "should get edit" do
    get edit_preauthorization_url(@preauthorization)
    assert_response :success
  end

  test "should update preauthorization" do
    patch preauthorization_url(@preauthorization), params: { preauthorization: { admin: @preauthorization.admin, contributor: @preauthorization.contributor, email: @preauthorization.email, fulfilled: @preauthorization.fulfilled } }
    assert_redirected_to preauthorization_url(@preauthorization)
  end

  test "should destroy preauthorization" do
    assert_difference('Preauthorization.count', -1) do
      delete preauthorization_url(@preauthorization)
    end

    assert_redirected_to preauthorizations_url
  end
end
