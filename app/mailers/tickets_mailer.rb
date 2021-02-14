# frozen_string_literal: true

class TicketsMailer < ApplicationMailer
  def due_date_reminder(ticket)
    @ticket = ticket
    mail(to: @ticket.assigned_user, subject: "Ticket #{@ticket.id} : #{@ticket.title} due date reminder!")
  end
end
