require 'test_helper'

class ResourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resource = resources(:one)
  end

  test "should get index" do
    get resources_url
    assert_response :success
  end

  test "should get new" do
    get new_resource_url
    assert_response :success
  end

  test "should create resource" do
    assert_difference('Resource.count') do
      post resources_url, params: { resource: { active: @resource.active, description: @resource.description, discipline: @resource.discipline, general: @resource.general, link_url: @resource.link_url, mindset: @resource.mindset, motivation: @resource.motivation, planning: @resource.planning, resource_type: @resource.resource_type, resourcing: @resource.resourcing, time_management: @resource.time_management, title: @resource.title, user_id: @resource.user_id } }
    end

    assert_redirected_to resource_url(Resource.last)
  end

  test "should show resource" do
    get resource_url(@resource)
    assert_response :success
  end

  test "should get edit" do
    get edit_resource_url(@resource)
    assert_response :success
  end

  test "should update resource" do
    patch resource_url(@resource), params: { resource: { active: @resource.active, description: @resource.description, discipline: @resource.discipline, general: @resource.general, link_url: @resource.link_url, mindset: @resource.mindset, motivation: @resource.motivation, planning: @resource.planning, resource_type: @resource.resource_type, resourcing: @resource.resourcing, time_management: @resource.time_management, title: @resource.title, user_id: @resource.user_id } }
    assert_redirected_to resource_url(@resource)
  end

  test "should destroy resource" do
    assert_difference('Resource.count', -1) do
      delete resource_url(@resource)
    end

    assert_redirected_to resources_url
  end
end
