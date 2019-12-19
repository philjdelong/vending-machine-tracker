# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
owner = Owner.create(  name: "Phil")

machine_1 = owner.machines.create(  location: "Denver",
                                    id: 1
)

machine_2 = owner.machines.create(  location: "Boulder",
                                    id: 2
)

machine_3 = owner.machines.create(  location: "The Moon",
                                    id: 3
)

snack_1 = Snack.create( name: "Cheetos",
                        price: 1,
                        id: 1
)

snack_2 = Snack.create( name: "Fretos",
                        price: 2,
                        id:2
)

machine_1.snacks << [snack_2]
machine_2.snacks << [snack_1, snack_2]
