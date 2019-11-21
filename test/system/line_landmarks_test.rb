require "application_system_test_case"

class LineLandmarksTest < ApplicationSystemTestCase
  setup do
    @line_landmark = line_landmarks(:one)
  end

  test "visiting the index" do
    visit line_landmarks_url
    assert_selector "h1", text: "Line Landmarks"
  end

  test "creating a Line landmark" do
    visit line_landmarks_url
    click_on "New Line Landmark"

    fill_in "Landmark", with: @line_landmark.landmark_id
    fill_in "List", with: @line_landmark.list_id
    click_on "Create Line landmark"

    assert_text "Line landmark was successfully created"
    click_on "Back"
  end

  test "updating a Line landmark" do
    visit line_landmarks_url
    click_on "Edit", match: :first

    fill_in "Landmark", with: @line_landmark.landmark_id
    fill_in "List", with: @line_landmark.list_id
    click_on "Update Line landmark"

    assert_text "Line landmark was successfully updated"
    click_on "Back"
  end

  test "destroying a Line landmark" do
    visit line_landmarks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Line landmark was successfully destroyed"
  end
end
