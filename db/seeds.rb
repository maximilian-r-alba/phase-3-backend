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



puts "✅ Done seeding!"
