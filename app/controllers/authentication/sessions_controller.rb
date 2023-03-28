class Authentication::SessionsController < ApplicationController
  skip_before_action :protect_pages
  def new
  end
  def create 
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to capitalizacions_path, notice: t('.created')
    else
      redirect_to new_session_path, notice: t('.failed')
    end  

  end
  def destroy
    session.delete(:user_id)
    redirect_to sessions_path(:user_id)
    
  end
end