class DosesController < ApplicationController
  def create
    cocktail = Cocktail.find(params[:cocktail_id])
    puts params
    ingredient = Ingredient.find(params[:dose][:ingredient_id])
    @dose = Dose.new(dose_params)
    @dose.ingredient = ingredient
    @dose.cocktail = cocktail
    if @dose.save
      redirect_to cocktail, notice: 'Ingredient successfully added'
    else
      redirect_to cocktail, notice: 'Error while adding the ingredient'
    end
  end

  def destroy
    Dose.destroy(params[:id])
    redirect_to Cocktail.find(params[:cocktail_id])
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end
end
