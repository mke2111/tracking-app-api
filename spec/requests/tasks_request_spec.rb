RSpec.describe 'tasks', type: :request do
  # initialize test data
  let!(:session1) { create(:session) }
  let!(:session2) { create(:session, user_id: session1.user_id) }
  let!(:task1) { create(:task, session_id: session1.id, time: 10) }
  let!(:task2) { create(:task, session_id: session2.id, time: 2) }
  let!(:task3) { create(:task, session_id: session2.id, time: 1) }
  let!(:task4) { create(:task, session_id: session2.id, time: 5) }
  let!(:task5) { create(:task, session_id: session2.id, time: 6) }
  let!(:task6) { create(:task, session_id: session1.id, time: 8) }
  let!(:user_id) { session1.user_id }

  describe 'GET /top/:id' do
    # make HTTP get request before each example
    before { get "/top/#{user_id}", headers: encode_token({ user_id: user_id }) }
    it 'returns top 5 tasks with most time' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
  describe 'POST create valid task' do
    before do
      post '/tasks', params: { id: session1.id, task: { name: 'Go', time: 3 } },
                        headers: encode_token({ user_id: user_id })
    end
    it 'returns created session' do
      expect(json).not_to be_empty
      expect(json['name']).to eq('Go')
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
