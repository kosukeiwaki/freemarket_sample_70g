class ItemsController < ApplicationController


  before_action :set_item, only: [:show, :edit, :update]

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


    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else 
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end
  
  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :price, :size, :brand, :detail, :prefecture_id,
                                 :status, :fee, :shipping_date, images_attributes: [:picture, :_destroy, :id]).merge(saler_id: current_user.id)
  end

end
