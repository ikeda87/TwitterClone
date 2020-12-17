require "application_system_test_case"

class ToukousTest < ApplicationSystemTestCase
  setup do
    @toukou = toukous(:one)
  end

  test "visiting the index" do
    visit toukous_url
    assert_selector "h1", text: "Toukous"
  end

  test "creating a Toukou" do
    visit toukous_url
    click_on "New Toukou"

    fill_in "Content", with: @toukou.content
    click_on "Create Toukou"

    assert_text "Toukou was successfully created"
    click_on "Back"
  end

  test "updating a Toukou" do
    visit toukous_url
    click_on "Edit", match: :first

    fill_in "Content", with: @toukou.content
    click_on "Update Toukou"

    assert_text "Toukou was successfully updated"
    click_on "Back"
  end

  test "destroying a Toukou" do
    visit toukous_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Toukou was successfully destroyed"
  end
end
