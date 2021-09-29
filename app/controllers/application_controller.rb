class ApplicationController < ActionController::API
  before_action :require_login

  def encode_token(payload)
    JWT.encode(payload, 'secret')
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    return unless auth_header

    token = auth_header.split(' ')[1]
    begin
      JWT.decode(token, 'secret', true, algorithm: 'HS256')
    rescue JWT::DecodeError
      []
    end
  end

  def logged_user
    decoded_hash = decoded_token
    return if decoded_hash.empty?

    user_id = decoded_hash[0]['user_id']
    @user = User.find_by(id: user_id)
  end

  def logged_in?
    !!logged_user
  end

  def require_login
    render json: { message: 'Loggin in is required' }, status: :unauthorized unless logged_in?
  end
end
