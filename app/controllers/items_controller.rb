class ItemsController < ApplicationController
  def index
    @images = Image.all
    @items = Item.all.order("id DESC").page(params[:page]).per(3)
  end

  def show
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
  

end
