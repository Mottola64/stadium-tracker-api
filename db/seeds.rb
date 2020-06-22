# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(username: "Mike", email: "mike@m.com", password:"testing", password_confirmation:"testing")

teststadium = Stadium.create(name: "Citi Field", team: "New York Mets", city: "New York", user_id: "1")