class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktails_path(@cocktail)
    else
      render :new
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new

  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(cocktail_params)
    redirect_to cocktails_path(@cocktail)
  end

  def destroy
    set_cocktail_id
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def set_cocktail_id
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require("cocktail").permit(:name)
  end
end
