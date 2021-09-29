require 'rails_helper'

RSpec.describe 'Users', type: :request do
  # initialize test data
  let!(:test_user) { create(:user) }
  let!(:user_id) { test_user.id }

  # Test suite for GET /user
  describe 'GET /user/:id' do
    # make HTTP get request before each example
    before { get "/users/#{user_id}", headers: encode_token({ user_id: user_id }) }
    it 'returns user with token and welcome message' do
      expect(json).not_to be_empty
      expect(json.size).to eq(3)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
  describe 'POST create invalid user' do
    before { post '/users', params: { username: '', password: '' } }
    it 'returns status code 406' do
      expect(response).to have_http_status(406)
    end
  end
  describe 'POST create valid user' do
    before { post '/users', params: { username: 'test2', password: '222' } }
    it 'returns created user with token' do
      expect(json).not_to be_empty
      expect(json.size).to eq(2)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
