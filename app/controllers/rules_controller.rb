class RulesController < ApplicationController
  before_action :set_condominium, only: [:new, :create, :index]

  def index
    @rules = Rule.where(condominium_id: @condominium).order(created_at: :desc)
  end

  def new
    @rule = Rule.new
    @rules = Rule.where(condominium_id: @condominium.id).order(created_at: :desc)
  end

  def create
    @rule = Rule.new(rule_params)
    @rule.condominium = @condominium
    if @rule.save
      respond_to do |format|
        format.html { redirect_to new_condominium_rule_path(@condominium), notice: 'Regra criada com sucesso!' }
        format.text { render partial: "rules/card", locals: { rule: @rule }, formats: [:html] }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @rule = Rule.find(params[:id])
    if @rule.destroy
    redirect_to new_condominium_rule_path(@rule), notice: "Regra excluída com sucesso."
    else
    redirect_to new_condominium_rule_path(@rule), alert: "Você não tem permissão para excluir."
    end
  end

  private

  def set_condominium
    @condominium = Condominium.find(params[:condominium_id])
  end

  def rule_params
    params.require(:rule).permit(:title, :content)
  end
end
