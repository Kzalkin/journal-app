require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in users(:one)
    @category = categories(:one)
    @task = tasks(:one)
  end

  test "should create task" do
    assert_difference('Task.count') do
      post category_tasks_path(@category), params: { task: { title: "something", body: "something", date: @task.date } }
    end
    assert_redirected_to category_path(@category)
  end

  test "should show task" do
    get category_task_path(@category, @task)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_task_path(@category, @task)
    assert_response :success
  end

  test "should update task" do
    patch category_task_path(@category, @task), params: { task: { title: "anything", body: "anything" } }, headers: { "HTTP_REFERER" => category_task_path(@category, @task)}
    assert_redirected_to category_task_path(@category, @task)
  end

  test "set task to completed" do
    patch category_task_path(@category, @task), params: { task: {completed: true}}, headers: { "HTTP_REFERER" => category_task_path(@category, @task)}
    assert_redirected_to category_task_path(@category, @task)
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete category_task_path(@category, @task)
    end

    assert_redirected_to category_path(@category)
  end
end
