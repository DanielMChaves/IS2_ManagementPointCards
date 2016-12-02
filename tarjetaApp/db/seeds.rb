# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create 3 clients
edmundo = Client.create(
  id: '1234567B',
  name: 'Alfredo',
  surname: 'Ravot Clavo',
  tlf: '+34666666666',
  email: 'etc@upm.es',
  address: 'Campus Montegancedo'
)

josefa = Client.create(
  id: '2345678A',
  name: 'Josefa',
  surname: 'Iglesias',
  tlf: '+34672890192',
  email: 'josefa_iglesias@gmail.com',
  address: 'Plaza de los Comendadores 32'
)

Client.create(
  id: '00000000X',
  name: 'None',
  surname: 'Nothing',
  tlf: '+34000000000',
  email: 'example@domain.com',
  address: 'Calle alguna, 0'
)

# Create 4 cards
Card.create(client: edmundo)
Card.create(client: josefa)
Card.create(client: edmundo)
Card.create(client: edmundo)
