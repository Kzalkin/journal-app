class TasksController < ApplicationController
    before_action :set_categories, only: %i[index show edit new]
    def index
        @category = current_user.categories.find(params[:category_id])
        @tasks = @category.tasks
    end

    def show
        @category = current_user.categories.find(params[:category_id])
        @task = @category.tasks.find(params[:id])
    end

    def new
        @category = current_user.categories.find(params[:category_id])
        @task = @category.tasks.build
    end

    def create
        @category = current_user.categories.find(params[:category_id])
        @task = @category.tasks.create(task_params)
        redirect_to @category, notice: "Task Created"
    end

    def edit
        @category = current_user.categories.find(params[:category_id])
        @task = @category.tasks.find(params[:id])
    end

    def update
        @category = current_user.categories.find(params[:category_id])
        @task_item = @category.tasks.find(params[:id])
        @task = @task_item.update(task_params)
        redirect_to category_task_path(@category, @task_item), notice: "Task Updated"
    end

    def destroy
        @category = current_user.categories.find(params[:category_id])
        @task = @category.tasks.find(params[:id])
        @task.destroy
        redirect_to @category, notice: "Task Deleted"
    end

    def today
        @category = current_user.categories.find(params[:category_id])
    end

  private

  def set_categories
    @categories = current_user.categories
  end

  def task_params
    params.require(:task).permit(:title, :body, :date)
  end
end
