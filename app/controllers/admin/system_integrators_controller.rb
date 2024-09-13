class Admin::SystemIntegratorsController < Admin::AdminbaseController
  before_action :set_system_integrator, only: [:show, :edit, :update, :destroy]

  def index
    @system_integrators = if params[:search].present?
                            SystemIntegrator.where("name LIKE ?", "%#{params[:search]}%")
                          else
                            SystemIntegrator.all
                          end
  end

  def show
  end

  def new
    @system_integrator = SystemIntegrator.new
  end

  def create
    @system_integrator = SystemIntegrator.new(system_integrator_params)
    if @system_integrator.save!
      redirect_to admin_system_integrator_path(@system_integrator), notice: 'System Integrator was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @system_integrator.update(system_integrator_params)
      redirect_to admin_system_integrator_path(@system_integrator), notice: 'System Integrator was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @system_integrator.destroy
  end

  private

  def set_system_integrator
    @system_integrator = SystemIntegrator.find(params[:id])
  end

  def system_integrator_params
    params.require(:system_integrator).permit(:name, :desc, :image, :partnership_validity, :si_partnership_id)
  end
end
