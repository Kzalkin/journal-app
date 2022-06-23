require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test "task must have a date" do
    task = Task.new(title: "Task", body: "Body", date: nil)
    assert_not task.save
  end
end
