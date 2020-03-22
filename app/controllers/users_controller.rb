class UsersController < ApplicationController

  def show
    @user=User.find(params[:id])
    @items=Item.where(saler_id: current_user.id)
  end


end