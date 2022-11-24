class CategoriesController < ApplicationController
  # GET /categories or /categories.json
  def index
    @categories = current_user.categories
  end

  def new
    @category = Category.new
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(name: category_params[:name], icon: category_params[:icon], author: current_user)

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: 'Category was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json

  private

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
