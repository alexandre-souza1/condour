class RulesController < ApplicationController
  before_action :set_condominium, only: [:new, :create, :index]

  def index
    @rules = Rule.where(condominium_id: @condominium.id).order(created_at: :desc)
  end

  def new
    @rule = Rule.new
  end

  def create
    @rule = Rule.new(rule_params)
    @rule.condominium = @condominium
    if @rule.save
      redirect_to condominium_rules_path(@condominium), notice: 'the condominium rule was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @rule = Rule.find(params[:id])
    if @rule.destroy
      redirect_to condominium_rules_path(@rule), notice: "Regra excluída."
    else
      redirect_to condominium_rules_path(@rule), notice: 'A regra não foi excluída'
    end
  end

  private

  def set_condominium
    @condominium = Condominium.find(params[:condominium_id])
  end

  def rule_params
    params.require(:rule).permit(:title, :file)
  end
end
