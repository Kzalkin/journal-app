class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]
  before_action :set_categories, only: %i[index show edit new upcoming delayed]
  before_action :authenticate_user!

  # GET /categories or /categories.json
  def index
    @tasks = current_user.tasks.where('date = ?', Date.current)
  end

  # GET /categories/1 or /categories/1.json
  def show
    @tasks = @category.tasks.where('date = ?', Date.current)
    @upcoming_tasks = @category.tasks.where('date > ?', Date.current)
    @delayed_tasks = @category.tasks.where('date < ?', Date.current)
  end

  # GET /categories/new
  def new
    @category = current_user.categories.build
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories or /categories.json
  def create
    @category = current_user.categories.build(category_params)
      if @category.save
          redirect_to category_url(@category), notice: "Category was successfully created." 
      else
          redirect_to categories_path, notice: "#{@category.errors.full_messages[0]}" 
      end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
      if @category.update(category_params)
          redirect_to category_url(@category), notice: "Category was successfully updated."
      else
          render :edit
      end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.tasks.destroy_all
    @category.destroy
    redirect_to categories_url, notice: "Category was successfully destroyed."
  end

  def upcoming
    @tasks = current_user.tasks.where('date > ?', Date.current)
  end
  
  def delayed
    @tasks = current_user.tasks.where('date < ?', Date.current)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = current_user.categories.find(params[:id])
    end

    def set_categories
      @categories = current_user.categories
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:title)
    end
end
