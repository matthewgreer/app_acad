# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.create!(
    name: 'Garfield',
    sex: "M",
    birth_date: "1980-03-24",
    color: "orange",
    description: "loves lasagna"

    )

Cat.create!(
    name: 'Boots',
    sex: "M",
    birth_date: "1970-03-24",
    color: "white",
    description: "loves shoes"

    )

Cat.create!(
    name: 'Peter',
    sex: "M",
    birth_date: "2010-03-24",
    color: "brown",
    description: "loves coding"

    )

Cat.create!(
    name: 'Paloma',
    sex: "F",
    birth_date: "1999-03-24",
    color: "green",
    description: "loves ruby on rails"

    )