class SystemIntegratorsController < ApplicationController
  before_action :set_system_integrator, only: %i[ show edit update destroy ]

  # GET /system_integrators or /system_integrators.json
  def index
    per_page = 12
    @si_partnerships = SiPartnership.all
    @system_integrators = SystemIntegrator.all

    # Check if the request contains any filter parameters
    filter_params = [:si_partnerships]
    filter_applied = params.slice(*filter_params).present?

    if filter_applied
      @system_integrators = SystemIntegrator.filtered_system_integrators(params, @system_integrators)
    end

    if params[:search_query].present?
      search_query = params[:search_query]
      
      @system_integrators = @system_integrators
                            .where("system_integrators.name LIKE ? OR system_integrators.desc LIKE ?", 
                                   "%#{search_query}%", "%#{search_query}%")
    end

    @q = @system_integrators.ransack(params[:q])
    @system_integrators = @q.result(distinct: true).paginate(page: params[:page], per_page: per_page)

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /system_integrators/1 or /system_integrators/1.json
  def show
  end

  # GET /system_integrators/new
  def new
    @system_integrator = SystemIntegrator.new
  end

  # GET /system_integrators/1/edit
  def edit
  end

  # POST /system_integrators or /system_integrators.json
  def create
    @system_integrator = SystemIntegrator.new(system_integrator_params)

    respond_to do |format|
      if @system_integrator.save
        format.html { redirect_to system_integrator_url(@system_integrator), notice: "System integrator was successfully created." }
        format.json { render :show, status: :created, location: @system_integrator }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @system_integrator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /system_integrators/1 or /system_integrators/1.json
  def update
    respond_to do |format|
      if @system_integrator.update(system_integrator_params)
        format.html { redirect_to system_integrator_url(@system_integrator), notice: "System integrator was successfully updated." }
        format.json { render :show, status: :ok, location: @system_integrator }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @system_integrator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /system_integrators/1 or /system_integrators/1.json
  def destroy
    @system_integrator.destroy

    respond_to do |format|
      format.html { redirect_to system_integrators_url, notice: "System integrator was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_system_integrator
      @system_integrator = SystemIntegrator.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def system_integrator_params
      params.require(:system_integrator).permit(:name, :desc, :image_data, :partnership_validity, :si_partnership_id)
    end
end
