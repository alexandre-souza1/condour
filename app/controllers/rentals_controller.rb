class RentalsController < ApplicationController
  before_action :set_place, only: %i[index create new]
  before_action :set_condominium, only: %i[my_rentals index]

  def index
    @rental = Rental.where(place: @place).order(created_at: :desc)
  end

  def show
    @rental = Rental.find(params[:id])
  end

  def my_rentals
    @rentals = Rental.where(user: current_user).order(created_at: :desc)
    @condominium = Condominium.find(params[:condominium_id])
  end

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.place = @place
    @rental.user = current_user
    @condominium = @place.condominium_id
    if @rental.save
      redirect_to condominium_my_rentals_path(@condominium), notice: 'the rental order was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @rental = Rental.find(params[:id])
    if @rental.destroy
      redirect_to place_rentals_path(@rental), notice: "Agendamento Excluído com sucesso."
    else
      redirect_to place_rentals_path(@rental), notice: 'A ordem de compra não foi excluída'
    end
  end

  private

  def set_condominium
    @condominium = Condominium.find(params[:condominium_id])
  end

  def rental_params
    params.require(:rental).permit(:date, :time)
  end

  def set_place
    @place = Place.find(params[:place_id])
  end
end
