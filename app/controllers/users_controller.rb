class UsersController < ApplicationController

  def index

  end

  # def new
  #   @user = User.new
  #   @user.build_address
  # end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to users_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:nickname,:email,:firstname,:lastname,:birthday,:lastname_kana,:firstname_kana,
                                  address_attributes:[:id, :zip, :prefecture, :city, :block, :building, :phone_number,
                                    :lastname, :firstname, :lastname_kana, :firstname_kana])
  end

end