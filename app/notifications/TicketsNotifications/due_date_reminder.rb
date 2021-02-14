# frozen_string_literal: true

class DueDateReminder < ApplicationNotification
  attr_accessor :ticket

  def initialize(ticket)
    @ticket = ticket
  end

  def notify_by_mail

  end

end
