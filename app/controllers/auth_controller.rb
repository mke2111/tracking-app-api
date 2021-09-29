class AuthController < ApplicationController
  skip_before_action :require_login, only: %i[login auto_login]

  def login
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      payload = { user_id: user.id }
      token = encode_token(payload)
      render json: { user: user, jwt: token, success: "Welcome, #{user.username}" }
    else
      render json: { failure: 'Login Failed. Name or Password incorrect' }
    end
  end

  def auto_login
    if logged_user
      render json: logged_user
    else
      render json: { errors: 'No user logged in' }
    end
  end
end
