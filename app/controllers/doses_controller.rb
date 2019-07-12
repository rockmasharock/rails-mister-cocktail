class DosesController < ApplicationController
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end

  def destroy
    set_dose_id
    @dose.destroy
    redirect_to cocktails_path
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def set_ingredient
    ingredient_id = params["dose"]["ingredient_id"]
    @ingredient = Ingredient.find(ingredient_id)
  end

  def set_dose_id
    @dose = Dose.find(params[:id])
  end

  private

  def dose_params
    params.require("dose").permit(:description, :ingredient_id, :cocktail_id)
  end
end
