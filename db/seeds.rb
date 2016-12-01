# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

price_list = [
  [ "£", "£0 - £15" ],
  [ "££", "£16 - £25" ],
  [ "£££", "£25 - £50" ],
  [ "££££", "£50 - £100" ],
  [ "£££££", "£100+" ],
]

price_list.each do |characters, amount|
  Price.create( characters: characters, amount: amount )
end
