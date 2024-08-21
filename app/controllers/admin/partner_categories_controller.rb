class Admin::PartnerCategoriesController < Admin::AdminbaseController
  before_action :set_partner_category, only: [:show, :edit, :update, :destroy]

  def index
    # @partner_categories = PartnerCategory.all
    @partner_categories = if params[:search].present?
                            PartnerCategory.fetch_all_category(params[:search])
                          else
                            PartnerCategory.fetch_all_category
                          end
  end

  def show
  end

  def new
    @partner_category = PartnerCategory.new
  end

  def edit
  end

  def create
    @partner_category = PartnerCategory.new(partner_category_params)

    if @partner_category.save
      redirect_to [:admin, @partner_category], notice: 'Partner category was successfully created.'
    else
      render :new
    end
  end

  def update
    if @partner_category.update(partner_category_params)
      redirect_to [:admin, @partner_category], notice: 'Partner category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @partner_category.destroy
  end

  private

  def set_partner_category
    @partner_category = PartnerCategory.find(params[:id])
  end

  def partner_category_params
    params.require(:partner_category).permit(:name, :desc, :image)
  end
end
