# frozen_string_literal: true

FactoryBot.define do
  factory :ticket do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    due_date { Date.today + 2.days }
    assigned_user { build(:user) }
  end
end
