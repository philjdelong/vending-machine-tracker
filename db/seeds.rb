# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
owner = Owner.create(  name: "Phil")

machine = owner.machines.create(  location: "Denver")

snack_1 = machine.snacks.create(  name: "Cheetos",
                                  price: 1
)

snack_2 = machine.snacks.create(  name: "Fretos",
                                  price: 2
)
