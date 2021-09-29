module RequestSpecHelper
  def json
    JSON.parse(response.body)
  end

  def encode_token(payload)
    token = JWT.encode(payload, 'secret')
    {
      'Authorization': "Bearer #{token}"
    }
  end
end
