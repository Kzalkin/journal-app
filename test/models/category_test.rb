require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "category must have a title" do
    category = Category.new(title: nil)
    assert_not category.save
  end

  test "category should only be one word" do
    category = Category.new(title: "Category With Space")
    assert_not category.save
  end

  test "category must be unique" do
    existing = categories(:one)
    category = Category.new(title: existing.title)
    assert_not category.save
  end
end
