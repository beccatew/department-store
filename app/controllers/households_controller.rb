class HouseholdsController < ApplicationController
  before_action :set_household, only: [:show, :update, :edit, :destroy]

  def index
    @households = Household.all
  end

  def show
  end

  def new
    @household = Household.new
  end

  def edit
  end

  def create
    @household = Household.new(household_params)

    if @household.save
      redirect_to households_path(@household)
    else
      render :new
    end
  end

  def update
    if @household.update(household_params)
      redirect_to @households
    else
      render :edit
    end
  end

  def destroy
    @household.destroy
    redirect_to households_path(@household)
  end

private

  def set_household
    @household = Household.find(params[:id])
  end

  def household_params
    params.require(:household).permit(:name, :price, :description)
  end
end
