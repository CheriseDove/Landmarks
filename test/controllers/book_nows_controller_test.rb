require 'test_helper'

class BookNowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book_now = book_nows(:one)
  end

  test "requires landmark in list" do
      get new_book_now_url
      assert_redirected_to attractions_path
      assert_equal flash[:notice], 'Your list is empty'
    end

  test "should get index" do
    get book_nows_url
    assert_response :success
  end

  test "should get new" do
    post line_landmarks_url, params: { landmark_id: landmarks(:one).id }
    get new_book_now_url
    assert_response :success
  end

  test "should create book_now" do
    assert_difference('BookNow.count') do
      post book_nows_url, params: { book_now: { address: @book_now.address, email: @book_now.email, name: "book_now 1" , phone: @book_now.phone } }
    end

    assert_redirected_to attractions_path
  end

  test "should show book_now" do
    get book_now_url(@book_now)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_now_url(@book_now)
    assert_response :success
  end

  test "should update book_now" do
    patch book_now_url(@book_now), params: { book_now: { address: @book_now.address, email: @book_now.email, name: @book_now.name, phone: @book_now.phone } }
    assert_redirected_to book_now_url(@book_now)
  end

  test "should destroy book_now" do
    assert_difference('BookNow.count', -1) do
      delete book_now_url(@book_now)
    end

    assert_redirected_to book_nows_url
  end
end
