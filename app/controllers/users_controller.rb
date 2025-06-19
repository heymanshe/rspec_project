require "csv"

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def download_csv
    @users = User.all

    respond_to do |format|
      format.csv do
        response.headers["Content-Type"] = "text/csv"
        response.headers["Content-Disposition"] = "attachment; filename=users.csv"
        render template: "users/download_csv"
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :age)
  end
end
