# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, :mail, presence: true
  validates :time_zone, presence: true, time_zone: true
end