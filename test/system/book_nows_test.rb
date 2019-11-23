require "application_system_test_case"

class BookNowsTest < ApplicationSystemTestCase
  setup do
    @book_now = book_nows(:one)
  end

  test "visiting the index" do
    visit book_nows_url
    assert_selector "h1", text: "Book Nows"
  end

  test "creating a Book now" do
    visit book_nows_url
    click_on "New Book Now"

    fill_in "Address", with: @book_now.address
    fill_in "Email", with: @book_now.email
    fill_in "Name", with: @book_now.name
    fill_in "Phone", with: @book_now.phone
    click_on "Create Book now"

    assert_text "Book now was successfully created"
    click_on "Back"
  end

  test "updating a Book now" do
    visit book_nows_url
    click_on "Edit", match: :first

    fill_in "Address", with: @book_now.address
    fill_in "Email", with: @book_now.email
    fill_in "Name", with: @book_now.name
    fill_in "Phone", with: @book_now.phone
    click_on "Update Book now"

    assert_text "Book now was successfully updated"
    click_on "Back"
  end

  test "destroying a Book now" do
    visit book_nows_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Book now was successfully destroyed"
  end
end
