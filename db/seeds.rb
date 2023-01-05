require "open-uri"

puts '> Clearing the DB...'
Item.destroy_all
User.destroy_all

puts '> Creating Users and Items'
50.times do
  user = User.new(email: Faker::Internet.email, password: "password", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, about: Faker::Lorem.paragraph(sentence_count: 12), phone_number: Faker::PhoneNumber.cell_phone_in_e164)
  user.save
  profile_url = "https://picsum.photos/100"
  profile_file = URI.open(profile_url)
  user.photo.attach(io: profile_file, filename: 'profile_img.png', content_type: 'image/png')
  2.times do
    item = Item.new(title: Faker::Appliance.equipment, description: Faker::Lorem.paragraph(sentence_count: 2), address: %w[paris oslo perth hamburg trondheim bergen washington sydney melbourne johannesburg].sample, price: Faker::Number.between(from: 10.0, to: 80.0).round(2), deposit: rand(90..140), category: %w[Stereo Tools Camera Art Surfboards Scubagear Grill Bike Utilities Camping Instruments Wilderness Other].sample, user: user, rating: rand(3.5..5.0), review: ["I have been a Boro user for over a year now and I can't say enough good things about this company. It is so convenient to be able to borrow anything you need - whether it's clothes, tools, or sports equipment. Boro will take care of all that and make sure the quality is good. I love being able to borrow a new outfit when I need one but don't feel like buying one.",
             "The best thing about Boro is its trustworthiness. The company has never let me down, and I know that if I need an item for a short time period, I can rest assured that Boro will make it available to me at the best possible price. It's so convenient for when circumstances change and you just need something for a little while.",
             "I just want to say that Boro is amazing. I was able to find a lot of neat and interesting items on the app and I got some extra cash for my pocket. What's even better is that the app has an excellent customer service team who responds in less than 24 hours with any issues."].sample)
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
