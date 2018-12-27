# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# User.create! email: "admin@academy.org", phone: Faker::PhoneNumber.cell_phone,
# password: "foobar", password_confirmation: "foobar", tbl_rank_id: 1

# 20.times do |n|
#   email = "user-#{n+1}@organic.org"
#   password = "matkhau"
#   User.create! email: email, password: password, password_confirmation: password,
#   phone: Faker::PhoneNumber.cell_phone,
#   tbl_rank_id: Faker::Number.between(1,4)
# end

# 10.times do |n|
#   email = "moderator-#{n+1}@organic.org"
#   password = "matkhau"
#   User.create! email: email, password: password, password_confirmation: password,
#   phone: Faker::PhoneNumber.cell_phone,
#   tbl_rank_id: Faker::Number.between(1,3), tbl_shop_id: Faker::Number.between(1,5)
# end
# # RefUserRole.create! tbl_user_id: 1, tbl_role_id:1
# 20.times do |n|
#   RefUserRole.create! tbl_user_id: (n+1)*10+1, tbl_role_id: 3
# end
# 10.times do |n|
  # RefUserRole.create! tbl_user_id: (n+21)*10+1, tbl_role_id: 2
# end

# Account.create! name: Faker::LeagueOfLegends.champion, city: Faker::Address.city,
# address: Faker::Address.street_address, dob: Faker::Date.between(9000.days.ago, 6000.days.ago), tbl_user_id: 1

# 20.times do |n|
#   Account.create! name: Faker::LeagueOfLegends.champion, city: Faker::Address.city,
#   address: Faker::Address.street_address, dob: Faker::Date.between(9000.days.ago, 6000.days.ago), tbl_user_id: (n+1)*10+1
# end

# 10.times do |n|
#   Account.create! name: Faker::LeagueOfLegends.champion, city: Faker::Address.city,
#   address: Faker::Address.street_address, dob: Faker::Date.between(9000.days.ago, 6000.days.ago), tbl_user_id: (n+21)*10+1
# end

list_user_ids = User.all.pluck :id
list_product_ids = Product.all.pluck :id

# 30.times do |n|
#   Review.create! comment: Faker::Lorem.sentence, rating: Faker::Number.between(1,5), tbl_user_id: list_user_ids.sample, tbl_product_id: list_product_ids.sample
# end

# 30.times do |n|
#   Wishlist.create! user_id: list_user_ids.sample, product_id: list_product_ids.sample
# end

20.times do |n|
  Order.create! owner_name: Faker::LeagueOfLegends.champion,
    owner_email: "buyer-#{n+1}@gmail.com", owner_phone: Faker::PhoneNumber.cell_phone, owner_address: Faker::Address.street_address
end
