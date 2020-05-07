# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#  movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Space.create(
#  location: "Salón",
#  url: "https://scontent.fscl8-1.fna.fbcdn.net/v/t31.0-8/p960x960/10857345_451122011719863_1750245465905278200_o.jpg?_nc_cat=106&_nc_sid=7aed08&_nc_ohc=nzt1qcSBmJQAX8BtHbo&_nc_ht=scontent.fscl8-1.fna&_nc_tp=6&oh=0758dc20004109d5aa31a99de959694e&oe=5E97EA44"
#)

  #Space.create(
  #  location:"Terraza",
  #  url: "https://scontent.fscl8-1.fna.fbcdn.net/v/t31.0-8/p960x960/10857345_451122011719863_1750245465905278200_o.jpg?_nc_cat=106&_nc_sid=7aed08&_nc_ohc=nzt1qcSBmJQAX8BtHbo&_nc_ht=scontent.fscl8-1.fna&_nc_tp=6&oh=0758dc20004109d5aa31a99de959694e&oe=5E97EA44"
  #)

space1 = Space.create(
  name: "Salón",
  slug: "salon"
)

space2 = Space.create(
  name: "Terraza",
  slug: "terraza"
)

table1 = Table.create(
  space_id: space1.id,
  chair: 4,
  table_number: "1"
)

table2 =  Table.create(
    space_id: space2.id,
    chair: 4,
    table_number: "2"
  )
