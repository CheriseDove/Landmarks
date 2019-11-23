require 'test_helper'

class LineLandmarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_landmark = line_landmarks(:one)
  end

  test "should get index" do
    get line_landmarks_url
    assert_response :success
  end

  test "should get new" do
    get new_line_landmark_url
    assert_response :success
  end

  test "should create line_landmark" do
    assert_difference('LineLandmark.count') do
      post :create, landmark_id: landmarks("Castle Keep")
    end

    assert_redirected_to list_path(assigns(:line_landmark).list)
  end

  test "should show line_landmark" do
    get line_landmark_url(@line_landmark)
    assert_response :success
  end

  test "should get edit" do
    get edit_line_landmark_url(@line_landmark)
    assert_response :success
  end

  test "should update line_landmark" do
    patch line_landmark_url(@line_landmark), params: {
  line_landmark: { landmark_id: @line_landmark.landmark_id }
  }
  assert_redirected_to list_path(@line_landmark.list)
  end

  test "should destroy line_landmark" do
    assert_difference('LineLandmark.count', -1) do
      delete line_landmark_url(@line_landmark)
    end

    assert_redirected_to line_landmarks_url
  end
end
