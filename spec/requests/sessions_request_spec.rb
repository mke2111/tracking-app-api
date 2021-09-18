require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  # initialize test data
  let!(:session1) { create(:session) }
  let!(:session2) { create(:session, user_id: session1.user_id) }
  let!(:task1) { create(:task, session_id: session1.id, time: 10) }
  let!(:task2) { create(:task, session_id: session2.id, time: 2) }
  let!(:user_id) { session1.user_id }

  describe 'GET /longest/:id' do
    # make HTTP get request before each example
    before { get "/longest/#{user_id}", headers: encode_token({ user_id: user_id }) }
    it 'returns longest session' do
      expect(json).not_to be_empty
      expect(json['total_time']).to eq(10)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
  describe 'GET /latest/:id' do
    # make HTTP get request before each example
    before { get "/latest/#{user_id}", headers: encode_token({ user_id: user_id }) }
    it 'returns latest session' do
      expect(json).not_to be_empty
      expect(json.size).to eq(7)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
  describe 'GET /sessions/:id' do
    # make HTTP get request before each example
    before { get "/sessions/#{session1.id}", headers: encode_token({ user_id: user_id }) }
    it 'returns specific session' do
      expect(json).not_to be_empty
      expect(json['id']).to eq(session1.id)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
  describe 'POST create valid session' do
    before { post '/sessions', params: { session: { title: 'Go' } }, headers: encode_token({ user_id: user_id }) }
    it 'returns created session' do
      expect(json).not_to be_empty
      expect(json.size).to eq(7)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
