# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user model' do
    let(:user) { build(:user) }

    it 'should be valid' do
      expect(user.valid?).to be true
    end

    describe 'relations' do
      it { should have_many(:tickets).dependent(:destroy) }
    end

    describe 'validations' do
      it { should validate_presence_of :mail }
      it { should validate_presence_of :name }
      it { should validate_presence_of :time_zone }
    end

    describe 'time zone validation' do
      it 'should not be valid if time zone is invalid' do
        user.time_zone = 'not valid timezone'
        expect(user.valid?).to be false
      end
    end
  end
end
