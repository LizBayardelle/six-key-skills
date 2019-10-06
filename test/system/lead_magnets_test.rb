require "application_system_test_case"

class LeadMagnetsTest < ApplicationSystemTestCase
  setup do
    @lead_magnet = lead_magnets(:one)
  end

  test "visiting the index" do
    visit lead_magnets_url
    assert_selector "h1", text: "Lead Magnets"
  end

  test "creating a Lead magnet" do
    visit lead_magnets_url
    click_on "New Lead Magnet"

    check "Active" if @lead_magnet.active
    fill_in "Description", with: @lead_magnet.description
    check "Discipline" if @lead_magnet.discipline
    fill_in "Link url", with: @lead_magnet.link_url
    check "Mindset" if @lead_magnet.mindset
    check "Motivation" if @lead_magnet.motivation
    check "Planning" if @lead_magnet.planning
    check "Resourcing" if @lead_magnet.resourcing
    check "Time management" if @lead_magnet.time_management
    fill_in "Title", with: @lead_magnet.title
    fill_in "Type", with: @lead_magnet.type
    fill_in "User", with: @lead_magnet.user_id
    click_on "Create Lead magnet"

    assert_text "Lead magnet was successfully created"
    click_on "Back"
  end

  test "updating a Lead magnet" do
    visit lead_magnets_url
    click_on "Edit", match: :first

    check "Active" if @lead_magnet.active
    fill_in "Description", with: @lead_magnet.description
    check "Discipline" if @lead_magnet.discipline
    fill_in "Link url", with: @lead_magnet.link_url
    check "Mindset" if @lead_magnet.mindset
    check "Motivation" if @lead_magnet.motivation
    check "Planning" if @lead_magnet.planning
    check "Resourcing" if @lead_magnet.resourcing
    check "Time management" if @lead_magnet.time_management
    fill_in "Title", with: @lead_magnet.title
    fill_in "Type", with: @lead_magnet.type
    fill_in "User", with: @lead_magnet.user_id
    click_on "Update Lead magnet"

    assert_text "Lead magnet was successfully updated"
    click_on "Back"
  end

  test "destroying a Lead magnet" do
    visit lead_magnets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lead magnet was successfully destroyed"
  end
end
