class PlacesController < ApplicationController
  before_action :set_condominium, only: [:new, :create, :destroy, :index]

  def index
    @places = Place.where(condominium_id: @condominium.id).order(created_at: :desc)
  end

  def show
    @place = Place.find(params[:id])
  end

  def new
    @place = Place.new
    @condominium = Condominium.find(params[:condominium_id])
  end

  def create
    @condominium = Condominium.find(params[:condominium_id])
    @place = Place.new(place_params)
    @place.condominium = @condominium
    if @place.save
      redirect_to place_path(@place), notice: 'O local foi criado com sucesso'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @condominium = @place.condominium
    if @place.destroy
      redirect_to condominium_places_path(@condominium), notice: "O local excluído com sucesso."
    else
      render :edit, alert: "Você não tem permissão para excluir este condomínio."
    end
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    if @place.update(place_params)
      redirect_to place_path(@place), notice: 'o Local atualizado com sucesso'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_condominium
    @condominium = Condominium.find(params[:condominium_id])
  end

  def place_params
    params.require(:place).permit(:name, :price, :description, photos: [])
  end
end
