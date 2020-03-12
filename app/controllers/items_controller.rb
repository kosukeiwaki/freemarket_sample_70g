class ItemsController < ApplicationController

  before_action :set_item, only: [:show]

  def index
    @images = Image.all
    @items = Item.all.order("id DESC").page(params[:page]).per(3)
  end

  def show
    # @category = Category.find(params[:id])
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    @item.region = @item.prefecture.name
    @item.stock = 0


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

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :price, :size, :brand, :detail, :prefecture_id,
                                 :status, :fee, :shipping_date, images_attributes: [:picture]).merge(user_id: current_user.id)
  end

end
