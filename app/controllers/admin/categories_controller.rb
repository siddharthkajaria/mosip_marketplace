class Admin::CategoriesController < Admin::AdminbaseController
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = if params[:search].present?
                    Category.fetch_all_category(params[:search])
                  else
                    Category.fetch_all_category
                  end
  end

  def show; end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.new(category_params)
    @category.code = category_params[:name].parameterize.underscore

    if @category.save
      redirect_to admin_category_url(@category), notice: 'Category was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @category.update(category_params)
      redirect_to admin_category_url(@category), notice: 'Category was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
