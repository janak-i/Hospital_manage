require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe "validations" do
    let(:appointment) { build(:appointment) }

    it "should be valid with valid attributes" do
      expect(appointment).to be_valid
    end

    it "should validate appointment time" do
      appointment.appointment_time = Time.current.change(hour: 6) # Set appointment time to 6 AM
      expect(appointment).to be_invalid
      expect(appointment.errors[:appointment_time]).to include("should be between 11 PM and 6 AM")
    end

    it "should validate duplicate appointments" do
      create(:appointment, appointment_time: appointment.appointment_time) # Create another appointment with the same time
      expect(appointment).to be_invalid
      expect(appointment.errors[:appointment_time]).to include("has already been taken")
    end

  end
end
