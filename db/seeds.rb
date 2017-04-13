# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

[ 'Cut', 'Colour', 'Blow Dry', 'Styling', 'Extensions', 'Mens' ].each do |name|
  Treatment.find_or_create_by( {name: name} )
end

price_list = [
  [ '£', '£0 - £15' ],
  [ '££', '£16 - £25' ],
  [ '£££', '£25 - £50' ],
  [ '££££', '£50 - £100' ],
  [ '£££££', '£100+' ],
]

price_list.each do |characters, amount|
  Price.find_or_create_by( characters: characters, amount: amount )
end