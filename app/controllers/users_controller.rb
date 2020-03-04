class UsersController < ApplicationController

  def create(user_params)
  end

  private
    def user_params
      params.require(:user).permit(:)
    end

end
