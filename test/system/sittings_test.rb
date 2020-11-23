require "application_system_test_case"

class SittingsTest < ApplicationSystemTestCase
  setup do
    @sitting = sittings(:one)
  end

  test "visiting the index" do
    visit sittings_url
    assert_selector "h1", text: "Sittings"
  end

  test "creating a Sitting" do
    visit sittings_url
    click_on "New Sitting"

    fill_in "Quiz", with: @sitting.quiz_id
    fill_in "Results", with: @sitting.results
    fill_in "User", with: @sitting.user_id
    click_on "Create Sitting"

    assert_text "Sitting was successfully created"
    click_on "Back"
  end

  test "updating a Sitting" do
    visit sittings_url
    click_on "Edit", match: :first

    fill_in "Quiz", with: @sitting.quiz_id
    fill_in "Results", with: @sitting.results
    fill_in "User", with: @sitting.user_id
    click_on "Update Sitting"

    assert_text "Sitting was successfully updated"
    click_on "Back"
  end

  test "destroying a Sitting" do
    visit sittings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sitting was successfully destroyed"
  end
end
