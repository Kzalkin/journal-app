require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in users(:one)
    @category = categories(:one)
  end

  test "should get index" do
    get categories_path
    assert_response :success
  end

  test "should create category" do
    assert_difference('Category.count') do
      post categories_path, params: { category: { title: "something" } }
    end
    assert_redirected_to category_path(Category.last)
  end

  test "should show category" do
    get category_path(@category)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_path(@category)
    assert_response :success
  end

  test "should update category" do
    patch category_path(@category), params: { category: { title: "anything" } }
    assert_redirected_to category_path(@category)
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete category_path(@category)
    end

    assert_redirected_to categories_path
  end
end
