# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tickets, class_name: 'Ticket', foreign_key: 'assigned_user_id', dependent: :destroy

  validates :name, :mail, presence: true
  validates :time_zone, presence: true, time_zone: true
  validates :due_date_reminder_interval, numericality: { greater_than_or_equal_to: 0 }

end
