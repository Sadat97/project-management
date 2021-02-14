# frozen_string_literal: true

class ApplicationNotification
  def scheduled_date_time
    @ticket.reminder_date_time.utc
  end
end
