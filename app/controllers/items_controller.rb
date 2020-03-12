class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :confirm]

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private

  def set_item
    @item = Item.find(params[:id])
  end

end
