# frozen_string_literal: true

module TicketNotifications
  class DueDateReminder < ApplicationNotification
    attr_accessor :ticket

    def initialize(ticket)
      @ticket = ticket
    end

    # this can be used to call different delivery methods at once if needed
    def deliver
      notify_by_mail
    end

    def notify_by_mail
      TicketReminderWorker.perform_at(scheduled_date_time, ticket.id)
    end
  end
end
