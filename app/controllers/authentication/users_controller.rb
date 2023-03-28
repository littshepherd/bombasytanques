class Authentication::UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      redirect_to tipo_movimientos_path
    else
      render :new, status: :unprocessable_entity, notice: 'Usuario creado correctamente'
    end
  end

  private 
  def user_params
    params.require(:user).permit(:nombre, :email, :password)
  end
end