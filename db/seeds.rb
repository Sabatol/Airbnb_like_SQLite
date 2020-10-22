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
City.destroy_all
Specialty.destroy_all 
SpecDoc.destroy_all

require 'faker'

spec = ["Allergist", "Anesthesiologist", "Cardiologist", "Dermatologist", "Endocrinologist", "Gastroenterologist", "Hematologist", "Immunologist", "Internist"]

doctors = []
patients = []
specialties = [] 
cities = []

10.times do
  city = City.create(name: Faker::Address.city)
  cities << city
end


100.times do 
  patient = Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: cities.sample)
  patients << patient
end

50.times do
  random = rand(1..5)
  doctor = Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, zip_code: Faker::Number.number(digits: 5), city: cities.sample)
  doctors << doctor
end

for i in 0..8
  specialty = Specialty.create(name: spec[i])
  specialties << specialty
end

200.times do |index|
  Appointment.create(doctor: doctors.sample, patient: patients.sample, date: Faker::Time.between(from: DateTime.now - 700, to: DateTime.now, format: :long), city: cities.sample)
end

100.times do
  SpecDoc.create(doctor: doctors.sample, specialty: specialties.sample)
end



