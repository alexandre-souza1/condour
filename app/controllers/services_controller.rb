class ServicesController < ApplicationController

  def index
    @service = Service.all
  end

  def show
    @service = Service.find(params[:id])
  end

  def new
    @Service = Service.new
  end

  def create
    @service = Service.new(params [:id])
    @service.user = current_user
    if @service.save
      redirect_to _path(@service), notice: 'the service order was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def Service_params
    params.require(:order).permit(:type :identification :date :time)
  end
end
