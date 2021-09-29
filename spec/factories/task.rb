FactoryBot.define do
  factory :task do
    name { Faker::ProgrammingLanguage.name }
    time { Faker::Number.decimal(l_digits: 2) }
  end
end
