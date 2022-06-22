require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test "task must have a date" do
    task = Task.new(title: "Task", body: "Body", date: nil)
    task.save
    assert_not task.valid?
  end
end
