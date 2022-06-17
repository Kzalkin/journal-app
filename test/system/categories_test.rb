require "application_system_test_case"

class CategoriesTest < ApplicationSystemTestCase
  setup do
    sign_in users(:one)
    @category = categories(:one)
    visit categories_path
  end

  test "creating a Category" do
    assert_text "Tasks Today"

    fill_in "Category title", with: "Test"
    click_on "Create Category"

    assert_text "Test"
  end

  test "view a category details" do
    click_on @category.title
    assert_text "#{@category.title} Tasks"
  end

  test "updating a Category" do
    click_on @category.title
    assert_text "Today"

    click_on(class: "edit-category")
    assert_text "Editing Category"

    fill_in "New category title", with: "School"
    click_on "Update Category"

    assert_text "School"
  end

  test "destroying a Category" do
    assert_text "Tasks Today"
    page.accept_confirm do
      first(".category-delete").click
    end
    assert_text "Category was successfully destroyed"
  end
end
