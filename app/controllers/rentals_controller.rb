class RentalsController < ApplicationController
  before_action :set_place, only: [:index, :create]

  def index
    @rental = Rental.where(place_id: @place.id).order(created_at: :desc)
  end

  def show
    @rental = Rental.find(params[:id])
  end

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.place = @place
    @rental.user = current_user
    if @rental.save
      redirect_to condominium_places_path(@place), notice: 'the rental order was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:date, :time)
  end

  def set_place
    @place = Place.find(params[:place_id])
  end

end
