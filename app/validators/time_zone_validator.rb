# frozen_string_literal: true

# Time zone string validator
class TimeZoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << (options[:message] || 'is not a valid time zone!') unless ActiveSupport::TimeZone[value]
  end
end
