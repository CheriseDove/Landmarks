require "application_system_test_case"

class LandmarksTest < ApplicationSystemTestCase
  setup do
    @landmark = landmarks(:one)
  end

  test "visiting the index" do
    visit landmarks_url
    assert_selector "h1", text: "Landmarks"
  end

  test "creating a Landmark" do
    visit landmarks_url
    click_on "New Landmark"

    fill_in "Description", with: @landmark.description
    fill_in "Image url", with: @landmark.image_url
    fill_in "Location", with: @landmark.location
    fill_in "Name", with: @landmark.name
    fill_in "Price", with: @landmark.price
    click_on "Create Landmark"

    assert_text "Landmark was successfully created"
    click_on "Back"
  end

  test "updating a Landmark" do
    visit landmarks_url
    click_on "Edit", match: :first

    fill_in "Description", with: @landmark.description
    fill_in "Image url", with: @landmark.image_url
    fill_in "Location", with: @landmark.location
    fill_in "Name", with: @landmark.name
    fill_in "Price", with: @landmark.price
    click_on "Update Landmark"

    assert_text "Landmark was successfully updated"
    click_on "Back"
  end

  test "destroying a Landmark" do
    visit landmarks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Landmark was successfully destroyed"
  end
end
