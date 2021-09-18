require 'rails_helper'
require 'capybara/rspec'

RSpec.describe User, type: :model do
  # Association test
  it { should have_many(:sessions) }
  it { should have_secure_password }
  # Validation tests
  it { should validate_presence_of(:username) }
end
