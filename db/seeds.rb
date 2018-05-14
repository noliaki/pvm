# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |i|
  user = User.new(
    email: "hoge_#{i}@example.com",
    password: 'fugahoge'
  )
  user.save!
  3.times do
    user.gifts.create
  end
end

10.times do |i|
  prize = Prize.create!(
    name: "prize_#{i}",
    description: "prize_#{i}の説明が入ります。prize_#{i}の説明が入ります。prize_#{i}の説明が入ります。prize_#{i}の説明が入ります。",
    price: i
  )
end

admin_user = AdminUser.new(
  email: "admin@example.com",
  password: "admin_admin"
)
admin_user.save!
