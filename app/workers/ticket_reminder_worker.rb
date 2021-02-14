# frozen_string_literal: true

class TicketReminderWorker
  include Sidekiq::Worker

  def perform(ticket_id)
    ticket = Ticket.find(ticket_id)
    TicketsMailer.due_date_reminder(ticket).deliver_later
  end
end
