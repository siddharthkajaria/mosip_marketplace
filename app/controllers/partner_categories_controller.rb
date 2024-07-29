class PartnerCategoriesController < ApplicationController
  before_action :set_partner_category, only: %i[ show edit update destroy ]

  # GET /partner_categories or /partner_categories.json
  def index
    @partner_categories = PartnerCategory.all
  end

  # GET /partner_categories/1 or /partner_categories/1.json
  def show
  end

  # GET /partner_categories/new
  def new
    @partner_category = PartnerCategory.new
  end

  # GET /partner_categories/1/edit
  def edit
  end

  # POST /partner_categories or /partner_categories.json
  def create
    @partner_category = PartnerCategory.new(partner_category_params)

    respond_to do |format|
      if @partner_category.save
        format.html { redirect_to partner_category_url(@partner_category), notice: "Partner category was successfully created." }
        format.json { render :show, status: :created, location: @partner_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @partner_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /partner_categories/1 or /partner_categories/1.json
  def update
    respond_to do |format|
      if @partner_category.update(partner_category_params)
        format.html { redirect_to partner_category_url(@partner_category), notice: "Partner category was successfully updated." }
        format.json { render :show, status: :ok, location: @partner_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @partner_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partner_categories/1 or /partner_categories/1.json
  def destroy
    @partner_category.destroy

    respond_to do |format|
      format.html { redirect_to partner_categories_url, notice: "Partner category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partner_category
      @partner_category = PartnerCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def partner_category_params
      params.require(:partner_category).permit(:name, :desc, :image_data)
    end
end
