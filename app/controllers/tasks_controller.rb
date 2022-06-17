class TasksController < ApplicationController
    before_action :set_categories, only: %i[index show edit new]
    before_action :set_category, only: %i[new index create update]
    before_action :set_task, only: %i[show edit destroy]
    before_action :authenticate_user!

    def index
        @tasks = @category.tasks.where('date = ?', Date.current)
        @upcoming_task = @category.tasks.where('date > ?', Date.current)
        @delayed_task = @category.tasks.where('date < ?', Date.current)
    end

    def show
    end

    def new
        @task = @category.tasks.build
    end

    def create
        @task = @category.tasks.create(task_params)
        redirect_to @category, notice: "Task Created"
    end

    def edit
    end

    def update
        @task_item = @category.tasks.find(params[:id])
        @task = @task_item.update(task_params)
        if request.referrer.include? "edit"
            redirect_to @category
        else
            redirect_to request.referrer, notice: "Task Updated"
        end
    end

    def destroy
        @task.destroy
        redirect_to @category, notice: "Task Deleted"
    end

  private

  def set_category
    @category = current_user.categories.find(params[:category_id])
  end

  def set_task
    @category = current_user.categories.find(params[:category_id])
    @task = @category.tasks.find(params[:id])
  end

  def set_categories
    @categories = current_user.categories
  end

  def task_params
    params.require(:task).permit(:title, :body, :date, :completed)
  end
end
