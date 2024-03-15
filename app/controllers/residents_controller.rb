class ResidentsController < ApplicationController
  before_action :set_condominium, only: [:index]

  def index
    @residents = Resident.all
  end

  def edit
  end

  def update
  end

  def new
    @user = User.find_by(cpf: params[:cpf])
    @cpf = params[:cpf]
    @resident = Resident.new
    @condominium = Condominium.find(params[:condominium_id])
  end

  def create
    @condominium = Condominium.find(params[:condominium_id])
    # Encontre o usuário com base no CPF (ou outro critério)
    @user = User.find_by(cpf: params["resident"]["cpf"])

    # Crie um novo residente associado ao usuário e ao condomínio
    @resident = Resident.new(resident_params)
    @resident.user = @user

    # Suponha que você também tenha um parâmetro para o condomínio (por exemplo, :condominium_id)
    @resident.condominium_id = params[:condominium_id]

    if @resident.save
      # Redirecione para a página de exibição do residente criado
      redirect_to condominium_residents_path(@condominium), notice: 'Residente criado com sucesso!'
    else
      # Caso haja erros na validação, renderize o formulário novamente
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_condominium
    @condominium = Condominium.find(params[:condominium_id])
  end

  def resident_params
    #checar se esta vindo como resident ou como user
    params.require(:resident).permit(:role, :block, :residence_number)
  end
end
