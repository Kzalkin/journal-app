require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @category_first = categories(:one)
    @category_second = categories(:two)
    sign_in users(:one)
    @task = tasks(:one)
    visit categories_path
    click_on @category_first.title
  end
  test "creating a task" do
    click_on "New Task"
    assert_text "New Task"

    fill_in "Task Title", with: "Task Test Title"
    fill_in "Task Body", with: "Task Test Body"
    click_on "Create Task"
    assert_text "Task Test Title"
  end

  test "updating a task" do 
    click_on @task.title, match: :first
    click_on(class: "edit-task")

    assert_text "Update Task"
    fill_in "Task Title", with: "Updated Task Title"
    fill_in "Task Body", with: "Updated Task Body"
    click_on "Update Task"
    assert_text "Updated Task Title"
  end

  test "delete a task" do
    click_on @task.title, match: :first
    click_on(class: "delete-task")
    assert_text "Task Deleted"
  end

  test "sort all tasks today" do
    
    click_on "New Task"
    fill_in "Task Title", with: "Task 1"
    fill_in "Task Body", with: "Task 1"
    click_on "Create Task"
    
    click_on "New Task"
    fill_in "Task Title", with: "Task 2"
    fill_in "Task Body", with: "Task 2"
    click_on "Create Task"
    
    click_on @category_second.title
    click_on "New Task"
    fill_in "Task Title", with: "Task 3"
    fill_in "Task Body", with: "Task 3"
    click_on "Create Task"
    
    visit categories_path
    assert_text "Tasks Today"
    assert_text "Task 1" 
    assert_text "Task 2" 
    assert_text "Task 3" 
  end
end
