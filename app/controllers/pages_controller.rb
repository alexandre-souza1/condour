class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @condominia = Condominium.all

    if params[:query].present?
      @condominia = @condominia.search_by_name(params[:query])
    end

    if params[:category].present?
      @condominia = @condominia.where(category: params[:category])
    end
  end
end
