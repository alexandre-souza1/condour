class ServicesController < ApplicationController
  before_action :set_condominium, only: [:new, :create, :index]

  def index
    @services = Service.where(user_id: current_user).order(date: :asc)
  end

  def show
    @service = Service.find(params[:id])
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service.user = current_user
    if @service.save
      redirect_to condominium_services_path, notice: 'the service order was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      redirect_to condominium_services_path(@resident.condominium), notice: 'Agendamento de serviço atualizado com sucesso'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @service = Service.find(params[:id])
    condominium = @service.user.residents.first.condominium
    if @service.destroy
      redirect_to condominium_services_path(condominium), notice: "Agendamento Excluído com sucesso."
    else
      redirect_to condominium_services_path(condominium), notice: 'A ordem de compra não foi excluída'
    end
  end

  private

  def set_condominium
    @condominium = Condominium.find(params[:condominium_id])
  end

  def service_params
    params.require(:service).permit(:description, :identification, :date, :time)
  end
end
