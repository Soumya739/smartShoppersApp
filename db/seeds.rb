# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(name:"Monika", address: "add1997", contact_num: 23, city: "Seattle", email: "mon@gmail.com", password: "mon", password_confirmation: "mon");
User.create(name: "Chandler", address: "add1997", contact_num: 16, city: "Seattle", email: "chan@gmail.com", password: "chan", password_confirmation: "chan");
User.create(name: "joey", address: "add1997", contact_num: 36, city: "Seattle", email: "jo@gmail.com", password: "jo", password_confirmation: "jo");
User.create(name: "Phoebe", address: "add1997", contact_num: 47, city: "New York", email: "phoeb@gmail.com", password: "phoeb", password_confirmation: "phoeb");
User.create(name: "Ross", address: "add1997", contact_num: 37, city: "New York", email: "ross@gmail.com", password: "ross", password_confirmation: "ross");
User.create(name: "Rachel", address: "add1997", contact_num: 98, city: "New York", email: "rach@gmail.com", password: "rach", password_confirmation: "rach");

Cart.create(user_id: 1);
Cart.create(user_id: 2);
Cart.create(user_id: 3);
Cart.create(user_id: 4);
Cart.create(user_id: 5);
Cart.create(user_id: 6);

15.times do
    Store.create(name: ["Pike Grocery", "Whole Foods Market", "Albertsons", "Saveway Market", "Uwajimaya", "Community Grocery", "Metropolitan Market Queen Anne", "Pike Place Market", "Paris-Madrid Grocery", "QFC", "Amazon Go"].sample, city: ["Seattle", "Tacoma", "Bellevue", "Kent", "Renton", "Redmond","New York"].sample, location: ["905 Dexter", "803 Arora", "654 Pike", "433 Mercer", "373 Herison", "383 Daney", "365 Bell"].sample)
end

15.times do
    Order.create(user_id: rand(1..6))
end

10.times do
    Item.create(name: Faker::Food.ingredient, section: "ingredient" )
end

10.times do
    Item.create(name: Faker::Food.fruits, section: "fruit")
end
10.times do
    Item.create(name: Faker::Food.vegetables, section: "vegetable" )
end

20.times do
    Warehouse.create(item_id: rand(1..15), store_id: rand(1..15), price: Faker::Number.decimal( 1,  1), quantity: rand(1..15))
end

20.times do
  WarehouseOrder.create(order_id: rand(1..15), warehouse_id: rand(1..20), quantity: rand(1..5))
end
