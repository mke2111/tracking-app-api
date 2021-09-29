require 'rails_helper'

RSpec.describe Session, type: :model do
  # Association test
  it { should belong_to(:user) }
  it { should have_many(:tasks) }
  # Validation tests
  it { should validate_presence_of(:title) }

  describe 'scopes' do
    it 'returns session subjects total time' do
      session = create(:session)
      create(:task, name: 'test', time: 5, session_id: session.id)
      expect(Session.tasks_total_time(session.user_id)).to contain_exactly(session)
    end
  end
end
