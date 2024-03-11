class ServicesController < ApplicationController

  def index
    @service = Service.where(condominium_id: @condominium).order(created_at: :desc)
  end

  def show
    @service = Service.find(params[:id])
  end

  def new
    @service = Service.new
    @condominium = Condominium.find(params[:condominium_id])
  end

  def create
    @service = Service.new(service_params)
    @service.user = current_user
    if @service.save
      redirect_to condominium_service_path(@service), notice: 'the service order was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def service_params
    params.require(:service).permit(:type, :identification, :date, :time)
  end
end
