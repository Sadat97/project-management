FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name}
    mail { Faker::Address.email }


  end
end
