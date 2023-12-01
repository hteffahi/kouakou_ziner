class IngredientsController < ApplicationController

  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @ingredients = Ingredient.order(expiration: :asc)
    @ingredients = Ingredient.search_by_name(params[:query]) if params[:query].present?
    respond_to do |format|
      format.html
      format.text { render partial: 'list', locals: { ingredients: @ingredients }, formats: [:html] }
    end
  end

  def show
  end

  def edit
  end

  def update
    @ingredient.update(ingredient_params)
    redirect_to ingredients_path
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.user = current_user

    if @ingredient.save
      redirect_to ingredients_path, notice: 'Ingredient created'
    else
      render :new
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    redirect_to ingredients_path, status: :see_other
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :expiration, :amount, :unit, :user_id, :category_id)
  end
end
