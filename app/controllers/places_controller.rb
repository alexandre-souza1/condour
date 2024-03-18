class PlacesController < ApplicationController
  before_action :set_condominium, only: [:new, :create, :index, :apartments]
  before_action :authenticate_user!, except: [:apartments, :show]

  def index
    @condominium = Condominium.find(params[:condominium_id])
    @places = @condominium.places.where(apartment: false).order(created_at: :desc)
  end

  def show
    @place = Place.find(params[:id])
  end

  def apartments
    @condominium = Condominium.find(params[:condominium_id])
    @places = @condominium.places.where(apartment: true).order(created_at: :desc)
  end

  def apartments_new
    @condominium = Condominium.find(params[:condominium_id])
    @place = @condominium.places.new(apartment: true)
  end

  def apartments_create
    @condominium = Condominium.find(params[:condominium_id])
    @place = @condominium.places.new(place_params)
    @place.apartment = true # Define o valor de 'apartment' como verdadeiro

    if @place.save
      redirect_to condominium_apartments_path(@condominium), notice: 'Apartamento criado com sucesso'
    else
      render :apartments_new, status: :unprocessable_entity
    end
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.condominium = @condominium
    if @place.save
      redirect_to condominium_places_path(@condominium), notice: 'Área criada com sucesso'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    condominium = @place.condominium
    if @place.update(place_params)
      redirect_to condominium_places_path(condominium), notice: 'Área atualizada com sucesso'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @place = Place.find(params[:id])
    if @place.destroy
      redirect_to condominium_places_path(@place), notice: "Área excluída com sucesso."
    else
      redirect_to condominium_places_path(@place), notice: 'A área não foi excluída'
    end
  end

  private

  def set_condominium
    @condominium = Condominium.find(params[:condominium_id])
  end

  def place_params
    params.require(:place).permit(:name, :rent_price, :sale_price, :contact, :description, :apartment, :residence_number, :block, photos: [])
  end
end
