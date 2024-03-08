class ResidentsController < ApplicationController

  def index
    @users = User.where(condominium: nil)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    #checar se esta vindo como resident ou como user
    params.require(:resident).permit(:condominium_id, :role, :block, :residence_number)
  end
end
