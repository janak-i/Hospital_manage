require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { FactoryBot.build(:user) }

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(6) }
    it { should validate_presence_of(:role) }
    it { should validate_uniqueness_of(:email).case_insensitive }

    it 'calls the custom email uniqueness validation method' do
      user.save
      expect(user).to validate_uniqueness_of(:email).case_insensitive.with_message('has already been taken')
    end
  end

  describe 'enums' do
    it { should define_enum_for(:role).with_values(admin: 0, patient: 1, doctor: 2) }
  end
end
