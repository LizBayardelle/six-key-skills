require 'test_helper'

class LeadMagnetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lead_magnet = lead_magnets(:one)
  end

  test "should get index" do
    get lead_magnets_url
    assert_response :success
  end

  test "should get new" do
    get new_lead_magnet_url
    assert_response :success
  end

  test "should create lead_magnet" do
    assert_difference('LeadMagnet.count') do
      post lead_magnets_url, params: { lead_magnet: { active: @lead_magnet.active, description: @lead_magnet.description, discipline: @lead_magnet.discipline, link_url: @lead_magnet.link_url, mindset: @lead_magnet.mindset, motivation: @lead_magnet.motivation, planning: @lead_magnet.planning, resourcing: @lead_magnet.resourcing, time_management: @lead_magnet.time_management, title: @lead_magnet.title, type: @lead_magnet.type, user_id: @lead_magnet.user_id } }
    end

    assert_redirected_to lead_magnet_url(LeadMagnet.last)
  end

  test "should show lead_magnet" do
    get lead_magnet_url(@lead_magnet)
    assert_response :success
  end

  test "should get edit" do
    get edit_lead_magnet_url(@lead_magnet)
    assert_response :success
  end

  test "should update lead_magnet" do
    patch lead_magnet_url(@lead_magnet), params: { lead_magnet: { active: @lead_magnet.active, description: @lead_magnet.description, discipline: @lead_magnet.discipline, link_url: @lead_magnet.link_url, mindset: @lead_magnet.mindset, motivation: @lead_magnet.motivation, planning: @lead_magnet.planning, resourcing: @lead_magnet.resourcing, time_management: @lead_magnet.time_management, title: @lead_magnet.title, type: @lead_magnet.type, user_id: @lead_magnet.user_id } }
    assert_redirected_to lead_magnet_url(@lead_magnet)
  end

  test "should destroy lead_magnet" do
    assert_difference('LeadMagnet.count', -1) do
      delete lead_magnet_url(@lead_magnet)
    end

    assert_redirected_to lead_magnets_url
  end
end
