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
    @item.region = @item.prefecture.name

    if @item.save
      redirect_to root_path
    else
      render :new
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
      params.require(:item).permit(:name, :price, :size, :brand, :detail, :prefecture_id,
                                   :status, :fee, :shipping_date, images_attributes: [:picture]).merge(user_id: current_user.id)
    end
  

end
