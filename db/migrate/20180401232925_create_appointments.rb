class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.string :appointmentId
      t.string :date
      t.string :time
      t.string :patientId
      t.string :doctorName
      t.string :doctorId
      t.string :lastAppointment
      t.text :symptoms
      t.text :others

      t.timestamps
    end
  end
end
