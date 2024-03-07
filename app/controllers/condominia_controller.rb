class CondominiaController < ApplicationController
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @condominia = Condominium.all
  end

  def show
    @condominium = Condominium.find(params[:id])
  end

  def new
    @condominium = Condominium.new
  end

  def create
    @condominium = Condominium.new(condominium_params)
    @condominium.user = current_user
    if @condominium.save
      redirect_to condominium_path(@condominium), notice: 'O condomínio foi criado com sucesso'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @condominium = Condominium.find(params[:id])
    if @condominium.destroy
      redirect_to condominia_path, notice: "Condomínio excluído com sucesso."
    else
      redirect_to condominia_path, alert: "Você não tem permissão para excluir este condomínio."
    end
  end

  def edit
    @condominium = Condominium.find(params[:id])
  end

  def update
    if @condominium.update(condominium_params)
      redirect_to condominium_path(@condominium), notice: 'Condomínio atualizado com sucesso'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def condominium_params
    params.require(:condominium).permit(:name, :address, :cnpj, photos: [])
  end

  def require_admin
    unless current_user.role == "admin"
      redirect_to root_path, alert: "Apenas administradores podem realizar esta ação."
    end
  end
end
