class RulesController < ApplicationController
  before_action :set_condominium, only: [:index]
  def index
  end

  private

  def set_condominium
    @condominium = Condominium.find(params[:condominium_id])
  end
end
