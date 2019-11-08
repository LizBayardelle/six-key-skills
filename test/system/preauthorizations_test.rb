require "application_system_test_case"

class PreauthorizationsTest < ApplicationSystemTestCase
  setup do
    @preauthorization = preauthorizations(:one)
  end

  test "visiting the index" do
    visit preauthorizations_url
    assert_selector "h1", text: "Preauthorizations"
  end

  test "creating a Preauthorization" do
    visit preauthorizations_url
    click_on "New Preauthorization"

    check "Admin" if @preauthorization.admin
    check "Contributor" if @preauthorization.contributor
    fill_in "Email", with: @preauthorization.email
    check "Fulfilled" if @preauthorization.fulfilled
    click_on "Create Preauthorization"

    assert_text "Preauthorization was successfully created"
    click_on "Back"
  end

  test "updating a Preauthorization" do
    visit preauthorizations_url
    click_on "Edit", match: :first

    check "Admin" if @preauthorization.admin
    check "Contributor" if @preauthorization.contributor
    fill_in "Email", with: @preauthorization.email
    check "Fulfilled" if @preauthorization.fulfilled
    click_on "Update Preauthorization"

    assert_text "Preauthorization was successfully updated"
    click_on "Back"
  end

  test "destroying a Preauthorization" do
    visit preauthorizations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Preauthorization was successfully destroyed"
  end
end
