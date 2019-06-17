class Admin::CategoriesController < Admin::AdminController  

  before_action :set_category, only: [ :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, success: t('.created')
    else
      flash.now[:danger] = t('.notcreated')
      render :new
    end

  end

  def edit
  end

  def update
    if @category.update_attributes(category_params)
      redirect_to admin_categories_path, success: t('.updated')
    else
      flash.now[:danger] = t('.notupdated')
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path, info: t('.deleted')

  end

  private

  def set_category
    @category = Category.find(params[:id])

  end

  def category_params
    params.require(:category).permit(:name, :parent_id)

  end




end
