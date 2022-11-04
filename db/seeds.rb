require "open-uri"

puts '> Clearing the DB...'
Item.destroy_all
User.destroy_all

puts '> Creating Users and Items'
10.times do
  user = User.new(email: Faker::Internet.email, password: "password", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, about: Faker::Lorem.paragraph(sentence_count: 12), phone_number: Faker::PhoneNumber.cell_phone_in_e164)
  user.save
  profile_url = "https://picsum.photos/100"
  profile_file = URI.open(profile_url)
  user.photo.attach(io: profile_file, filename: 'profile_img.png', content_type: 'image/png')
  20.times do
    item = Item.new(title: Faker::Appliance.equipment, description: Faker::Lorem.paragraph(sentence_count: 2), address: %w[paris oslo perth hamburg trondheim bergen washington sydney melbourne johannesburg].sample, price: Faker::Number.between(from: 10.0, to: 80.0).round(2), deposit: rand(90..140), category: %w[Stereo Tools Camera Art Surfboards Scubagear Grill Bike Utilities Camping Instruments Wilderness Other].sample, user: user)
    item.save
    1.times do
      item_url = "https://picsum.photos/300/200"
      item_file = URI.open(item_url)
      item.photos.attach(io: item_file, filename: "item_img.png", content_type: 'image/png')
    end
  end
end

puts '> Finished seeding!'
puts "> Made #{User.count} users, and #{Item.count} items"
