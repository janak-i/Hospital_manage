class Appointment < ApplicationRecord
	belongs_to :patient
	belongs_to :doctor
	validate :valid_appointment_time
	validate :no_duplicate_appointments, on: :create
	enum status: { pending: 0, confirmed: 1, canceled: 2, completed: 3 }
	after_initialize :set_default_status, if: :new_record?

	private 


	def valid_appointment_time
		byebug
		return unless appointment_time
		if appointment_time.hour < 7 || appointment_time.hour >= 11
			errors.add(:appointment_time, "should be between 11 PM and 6 AM")
		end
	end


	def no_duplicate_appointments
		byebug
		if Appointment.exists?(appointment_time: appointment_time)
			errors.add(:appointment_time, "has already been taken")
		end
	end

	def valid_duration
		byebug
		return unless appointment_time && duration
		if duration < 30 || duration > 120
			errors.add(:duration_in_minutes, "should be between 30 and 120 minutes")
		end
	end

	def set_default_status
		self.status ||= :pending
	end
end












