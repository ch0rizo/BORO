puts '> Clearing the DB...'
Item.destroy_all
User.destroy_all


10.times do
  user = User.create!(email: Faker::Internet.email, password: "password", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, about: Faker::Lorem.paragraph(sentence_count: 3), phone_number: Faker::PhoneNumber.cell_phone_in_e164)
  3.times do
    Item.create!(title: Faker::Appliance.equipment, description: Faker::Lorem.paragraph(sentence_count: 2), price: Faker::Number.between(from: 10.0, to: 80.0).round(2), deposit: rand(90..140), category: Faker::Commerce.department, user: user)
  end
end

puts '> Finished seeding!'
puts "> Made #{User.count} users, and #{Item.count} items"