class UsersController < ApplicationController
  skip_before_action :require_login, only: [:create]

  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      payload = { user_id: user.id }
      token = encode_token(payload)
      render json: { user: user, jwt: token }
    else
      render json: { errors: user.errors.full_messages }, status: :not_acceptable
    end
  end

  def show
    user = obtain_user
    render json: user
  end

  private

  def user_params
    params.permit(:id, :username, :password)
  end

  def obtain_user
    User.find(params[:id])
  end
end
