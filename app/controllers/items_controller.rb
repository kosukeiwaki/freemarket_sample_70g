class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def item_params
      params.require(:item).permit(:name, :price, :size, :brand, :detail,
                                   :status, :fee, :region, :shipping_date)
    end
  

end
