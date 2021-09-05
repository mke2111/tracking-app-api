class UsersController < ApplicationController
  before_action :logged?, except: :create

  def show
    user = User.find(params[:id])
    measures = Measure.all
    render json: { user: user, measures: measures }
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: 200
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name)
  end

  def logged?
    redirect_to error_path unless !params[:uid].nil? || params[:uid] != ''
  end
end
