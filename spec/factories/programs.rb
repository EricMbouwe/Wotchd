FactoryBot.define do
  factory :program do
    name { Faker::Name.name }
    amount { 46 }
    author { Faker::Name.name }
    group { Faker::Name.name }
  end
end
