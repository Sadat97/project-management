# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :assigned_user, class_name: 'User'

  validates :title, :assigned_user, presence: true

  after_save :schedule_reminder_notification, if: :user_reminder_enabled?



  def reminder_date_time
    Time.use_zone(assigned_user.time_zone) do
      date = due_date - (assigned_user.due_date_reminder_interval || 0).days
      time = assigned_user.due_date_reminder_time
      DateTime.new(date.year, date.month, date.day, time.hour, time.min, time.sec, time.zone)
    end
  end

  private


  def user_reminder_enabled?
    assigned_user&.send_due_date_reminder
  end

  def schedule_reminder_enabled
    TicketNotifications::DueDateReminder.new(self).notify_by_mail
  end
end
