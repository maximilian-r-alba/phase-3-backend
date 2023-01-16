puts "🌱 Seeding spices..."

# Seed your database here
50.times do
    Book.create(
        name: Faker::Book.title, 
        genre: Faker::Book.genre, 
        author: Faker::Book.author, 
        rating: rand(1..5), 
    )
end

10.times do
    User.create(
        name: Faker::Name.name
    )
end

100.times do 
    Review.create(
        title: Faker::Emotion.adjective,
        rating: rand(1..5),
        user_id: rand(1..10)
    )
end


puts "✅ Done seeding!"
