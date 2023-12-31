# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts 'Limpando banco de dados'
User.destroy_all

Faker::Config.locale = 'pt-BR'

puts 'Criando usuários'
100.times do
  User.create!(name: Faker::Name.name,
               email: Faker::Internet.email,
               phone: Faker::PhoneNumber.phone_number.gsub(/\D/, ''),
               cpf: Faker::IDNumber.brazilian_citizen_number)
end
puts 'Usuários criados'
