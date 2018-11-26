class DrinksController < ApplicationController
before_action :set_drinks, only: [:show, :update, :destroy]

def index
    @drinks = Drink.all
    render json: @drinks
end

def show
    render json: @drink
end

def create
    @drink = Drink.new(drink_params)
    if @drink.save
        render json: @drink, status: :created, location: @drink
    else
        render json: @drink.errors, status: :unprocessable_entity
    end
end

def update
    if @drink.update(drink_params)
      render json: @drink
    else
      render json: @drink.errors, status: :unprocessable_entity
    end
  end

private

def set_drink
  @drink = Drink.find(params[:id])
end

def drink_params
   params.require(:drink).permit(:title, :description, :steps, :source)
end

end