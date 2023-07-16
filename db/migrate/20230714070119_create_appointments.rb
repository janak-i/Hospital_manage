class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.datetime :appointment_time
      t.string :status
      t.string :reason
      t.integer :duration
      t.string :room_number
      t.decimal :fee
      t.references :patient
      t.references :doctor
      t.timestamps
    end
  end
end
