require "application_system_test_case"

class UserTestsTest < ApplicationSystemTestCase
  setup do
    @user_test = user_tests(:one)
  end

  test "visiting the index" do
    visit user_tests_url
    assert_selector "h1", text: "User Tests"
  end

  test "creating a User test" do
    visit user_tests_url
    click_on "New User Test"

    click_on "Create User test"

    assert_text "User test was successfully created"
    click_on "Back"
  end

  test "updating a User test" do
    visit user_tests_url
    click_on "Edit", match: :first

    click_on "Update User test"

    assert_text "User test was successfully updated"
    click_on "Back"
  end

  test "destroying a User test" do
    visit user_tests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User test was successfully destroyed"
  end
end
