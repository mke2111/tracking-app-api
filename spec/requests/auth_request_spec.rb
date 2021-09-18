RSpec.describe 'Auth', type: :request do
  # initialize test data
  let!(:test_user) { create(:user) }
  let!(:user_id) { test_user.id }
  describe 'POST /login' do
    context 'when the request is valid' do
      before { post '/login', params: { username: test_user.username, password: test_user.password } }
      it 'logins a user' do
        expect(json['user']['username']).to eq('test')
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
