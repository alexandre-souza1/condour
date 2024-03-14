class ResidentsController < ApplicationController

  def index
  end

  def edit
  end

  def update
  end

  def new
    @user = User.find_by(cpf: params[:cpf])
    @resident = Resident.new
  end

  def create
  end

  private

  def resident_params
    #checar se esta vindo como resident ou como user
    params.require(:resident).permit(:user_id, :role, :block, :residence_number)
  end
end
