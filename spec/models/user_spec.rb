require 'rails_helper'

RSpec.describe User, type: :model do
  it {should validate_presence_of :mail}
  it {should validate_presence_of :name}
  it {should validate_presence_of :time_zone}

  describe 'should have valid time zone' do

  end
end
