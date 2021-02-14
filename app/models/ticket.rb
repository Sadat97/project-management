# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :assigned_user_id, class_name: 'User'
end
