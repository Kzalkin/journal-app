require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "category must have a title" do
    category = Category.new(title: nil)
    category.save
    assert_not category.valid?
  end

  test "category should only be one word" do
    category = Category.new(title: "Category With Space")
    category.save
    assert_not category.valid?
  end

  test "category must be unique" do
    existing = categories(:one)
    category = Category.new(title: existing.title)
    category.save
    assert_not category.valid?
  end
end
