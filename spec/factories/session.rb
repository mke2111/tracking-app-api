FactoryBot.define do
  factory :session do
    title { Faker::ProgrammingLanguage.name }
    user { create(:user) }
  end
end
