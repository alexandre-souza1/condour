class CondominiaController < ApplicationController
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @condominia = Condominium.all

    if params[:query].present?
      @condominia = @condominia.search_by_name(params[:query])
    end

    if params[:category].present?
      @condominia = @condominia.where(category: params[:category])
    end
  end

  def show
    @condominium = Condominium.find(params[:id])
    # Obtém os últimos 3 posts do admin associados ao condomínio
    @posts = Post.all
    @admin_posts = @posts.where(condominium_id: @condominium.id, user_id: @condominium.user ).last(3)
    @rentals = current_user.rentals
    @services = current_user.services
  end

  def new
    @condominium = Condominium.new
  end

  def create
    @condominium = Condominium.new(condominium_params)
    @condominium.user_id = current_user.id
    if @condominium.save
      Resident.create(user: current_user, condominium: @condominium, residence_number: 0, role: 0)
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
    @condominium = Condominium.find(params[:id])
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
    unless current_user.admin
      redirect_to root_path, alert: "Apenas administradores podem realizar esta ação."
    end
  end
end
