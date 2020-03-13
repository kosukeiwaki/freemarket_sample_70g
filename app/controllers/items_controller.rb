class ItemsController < ApplicationController
  before_action :set_params, only: [:show, :edit]
  # before_action :move_to_index, except: [:index, :show] 
  def index
    @items = Item.all
  end

  def show
    @user = User.find(params[:id])
    @category = Category.find(params[:id])
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

  def set_params
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in? && current_user.id == user.id
  end

end
