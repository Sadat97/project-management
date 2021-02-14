# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'ticket model' do
    let(:ticket) { build(:ticket) }

    it 'should be valid' do
      expect(ticket.valid?).to be true
    end

    describe 'relations' do
      it { should belong_to(:assigned_user) }
    end

    describe 'validations' do
      it { should validate_presence_of :title }
      it { should validate_presence_of :assigned_user }
      it { should validate_presence_of :due_date }
    end

    describe 'callbacks' do

      it 'triggers due date reminder notification if users enables reminders' do
        ticket.assigned_user.send_due_date_reminder = true
        expect(ticket).to receive(:schedule_reminder_notification)
        ticket.run_callbacks(:save)
      end

      it 'does not triggers due date reminder notification if users enables reminders' do
        ticket.assigned_user.send_due_date_reminder = false
        expect(ticket).to_not receive(:schedule_reminder_notification)
        ticket.run_callbacks(:save)
      end

      it 'schedule_reminder_notification should enqueue a new background job' do
        ticket.assigned_user.send_due_date_reminder = true
        ticket.save
        expect(TicketReminderWorker).to have_enqueued_sidekiq_job(ticket.id)
      end
    end
  end
end
