class UsersController < ApplicationController
  # renders sign up
  def new
  end
# receving for and creating a new users within parametersg
  def create
    user = User.create(user_params)
    if user.save
      sesion[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
