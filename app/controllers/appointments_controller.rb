class AppointmentsController < ApplicationController
	before_action :set_patient

	def index
		@appointments = @patient.appointments
		render json: @appointments
	end


	def create
		byebug
		appointment = @patient.appointments.build(appointment_params)
		if appointment.save
			render json: appointment, status: :created
		else
			render json: appointment.errors, status: :unprocessable_entity
		end
	end


	private

	def set_patient
		byebug
		@patient = Patient.find(params[:patient_id])
	end

	def appointment_params
		params.require(:appointment).permit(:appointment_time, :doctor_id, :reason, :room_number, :fee, :duration)
	end

	def current_user
		User.find_by(params[:user_id])
	end

end

