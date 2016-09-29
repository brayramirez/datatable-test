# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

print 'Seeding'

100.times do
  Product.create name: Faker::Commerce.product_name,
    amount: Faker::Commerce.price,
    stock: (0..20).to_a.sample,
    available: Faker::Date.between(1.week.ago, 3.days.from_now),
    description: Faker::Lorem.sentence

  print '.'
end

puts
