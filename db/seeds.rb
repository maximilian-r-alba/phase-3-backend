puts "🌱 Seeding spices..."

# Seed your database here

50.times do
    Book.create(
        title: Faker::Book.title, 
        subgenre: Faker::Book.genre, 
        author: Faker::Book.author, 
        rating: rand(1..5), 
        cover_url: "https://loremflickr.com/640/480/book,title,cover",
        summary: Faker::Lorem.paragraphs(number: 1),
        fiction?: [true, false].sample
    )
end

10.times do
    User.create(
        name: Faker::Name.name,
        avatar_url: Faker::Avatar.unique.image(size:"500x500", format:"jpg"),
        bio: Faker::Lorem.paragraphs(number:1),
        username: Faker::Internet.username(specifier: 5..8),
        password: Faker::Internet.password(min_length: 4, max_length: 8)
    )
end

100.times do 
    Review.create(
        title: Faker::Emotion.adjective,
        rating: rand(1..5),
        user_id: User.all.map{|user| user.id}.sample,
        book_id: Book.all.map{|book| book.id}.sample,
        content: Faker::Lorem.paragraphs(number: 3)
    )
end


puts "✅ Done seeding!"
