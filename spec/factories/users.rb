# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    mail { Faker::Internet.email }
    send_due_date_reminder { true }
    due_date_reminder_interval { 1 }
    due_date_reminder_time { Time.now }
    time_zone { 'Europe/Vienna' }
  end
end
