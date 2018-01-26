class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    # binding.pry
    @user = User.find(params[:id])
  end

  def update
    binding.pry
    @user = User.find(params[:id])
    if @user.update(user_params)
        redirect_to user_path(current_user.id), notice: "マイページを編集しました！"
    else
        redirect_to user_path(current_user.id)
        # render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
end
