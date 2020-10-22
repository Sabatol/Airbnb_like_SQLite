# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Appointment.destroy_all
Patient.destroy_all
Doctor.destroy_all

require 'faker'

doctors = []
patients = []

20.times do 
  patient = Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  doctor = Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, specialty: Faker::Lorem.word, zip_code: Faker::Number.number(digits: 5))
  doctors << doctor
  patients << patient
end

50.times do |index|
  Appointment.create(doctor: doctors.sample, patient: patients.sample, date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :long))
end

