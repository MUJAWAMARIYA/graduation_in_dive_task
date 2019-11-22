require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test "visiting the index" do
    visit posts_url
    assert_selector "h1", text: "Posts"
  end

  test "creating a Post" do
    visit posts_url
    click_on "New Post"

    fill_in "Id number", with: @post.ID_number
    fill_in "Cell", with: @post.cell
    check "Confirmation" if @post.confirmation
    fill_in "Contact", with: @post.contact
    fill_in "Country", with: @post.country
    fill_in "Date", with: @post.date
    fill_in "District", with: @post.district
    fill_in "Gender", with: @post.gender
    fill_in "Post reason", with: @post.post_reason
    fill_in "Province", with: @post.province
    fill_in "Sector", with: @post.sector
    fill_in "User name", with: @post.user_name
    fill_in "Village", with: @post.village
    click_on "Create Post"

    assert_text "Post was successfully created"
    click_on "Back"
  end

  test "updating a Post" do
    visit posts_url
    click_on "Edit", match: :first

    fill_in "Id number", with: @post.ID_number
    fill_in "Cell", with: @post.cell
    check "Confirmation" if @post.confirmation
    fill_in "Contact", with: @post.contact
    fill_in "Country", with: @post.country
    fill_in "Date", with: @post.date
    fill_in "District", with: @post.district
    fill_in "Gender", with: @post.gender
    fill_in "Post reason", with: @post.post_reason
    fill_in "Province", with: @post.province
    fill_in "Sector", with: @post.sector
    fill_in "User name", with: @post.user_name
    fill_in "Village", with: @post.village
    click_on "Update Post"

    assert_text "Post was successfully updated"
    click_on "Back"
  end

  test "destroying a Post" do
    visit posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Post was successfully destroyed"
  end
end
