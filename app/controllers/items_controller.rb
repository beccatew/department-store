class ItemsController < ApplicationController
  before_action :set_household
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = @household.items
  end

  def show
  end

  def new
    @item = @household.item.new
  end

  def edit
  end

  def create
    @item = @household.item.new(item_params)

    if @item.save
      redirect_to [@household, @item]
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to [@household, @item]
    else
      render :edit
    end
  end

  private
    def set_household
      @household = Household.find(params[:household_id])
    end

    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :price, :description)
    end

end
