require "application_system_test_case"

class BlogsTest < ApplicationSystemTestCase
  setup do
    @blog = blogs(:one)
  end

  test "visiting the index" do
    visit blogs_url
    assert_selector "h1", text: "Blogs"
  end

  test "creating a Blog" do
    visit blogs_url
    click_on "New Blog"

    fill_in "Body", with: @blog.body
    check "Discipline" if @blog.discipline
    check "Featured" if @blog.featured
    fill_in "Image url", with: @blog.image_url
    fill_in "Lead magnet", with: @blog.lead_magnet_id
    check "Mindset" if @blog.mindset
    check "Motivation" if @blog.motivation
    fill_in "Pinterest description", with: @blog.pinterest_description
    check "Planning" if @blog.planning
    check "Published" if @blog.published
    fill_in "Published at", with: @blog.published_at
    check "Resourcing" if @blog.resourcing
    fill_in "Teaser", with: @blog.teaser
    check "Time management" if @blog.time_management
    fill_in "Title", with: @blog.title
    fill_in "User", with: @blog.user_id
    click_on "Create Blog"

    assert_text "Blog was successfully created"
    click_on "Back"
  end

  test "updating a Blog" do
    visit blogs_url
    click_on "Edit", match: :first

    fill_in "Body", with: @blog.body
    check "Discipline" if @blog.discipline
    check "Featured" if @blog.featured
    fill_in "Image url", with: @blog.image_url
    fill_in "Lead magnet", with: @blog.lead_magnet_id
    check "Mindset" if @blog.mindset
    check "Motivation" if @blog.motivation
    fill_in "Pinterest description", with: @blog.pinterest_description
    check "Planning" if @blog.planning
    check "Published" if @blog.published
    fill_in "Published at", with: @blog.published_at
    check "Resourcing" if @blog.resourcing
    fill_in "Teaser", with: @blog.teaser
    check "Time management" if @blog.time_management
    fill_in "Title", with: @blog.title
    fill_in "User", with: @blog.user_id
    click_on "Update Blog"

    assert_text "Blog was successfully updated"
    click_on "Back"
  end

  test "destroying a Blog" do
    visit blogs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Blog was successfully destroyed"
  end
end
