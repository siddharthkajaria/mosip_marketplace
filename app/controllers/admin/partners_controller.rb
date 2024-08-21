class Admin::PartnersController < Admin::AdminbaseController
    before_action :set_partner, only: %i[show edit update destroy]
  
    def index
    #@partners = Partner.all
    @partners = if params[:search].present?
                    Partner.fetch_all_partner(params[:search])
                else
                    Partner.fetch_all_partner
                end
    end
  
    def show
    end
  
    def new
      @partner = Partner.new
    end
  
    def create
      @partner = Partner.new(partner_params)
      if @partner.save!
        redirect_to admin_partner_path(@partner), notice: 'Partner was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @partner.update(partner_params)
        redirect_to admin_partner_path(@partner), notice: 'Partner was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @partner.destroy
    end
  
    private
  
    def set_partner
      @partner = Partner.find(params[:id])
    end
  
    def partner_params
      params.require(:partner).permit(:name, :desc, :position, :url, :partner_category_id, :image)
    end
  end
  