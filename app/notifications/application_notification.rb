# frozen_string_literal: true

class ApplicationNotification
  def scheduled_date_time
    @ticket.reminder_date_time
  end

  def by_mail(mailer_class, method, *args); end
end
