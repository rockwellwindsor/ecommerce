# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create 25 random products.
25.times do |n|
    @i = rand(1..25)
    title  = Faker::Commerce.product_name
    description = Faker::Hipster.paragraph
    image = "#{@i}.jpg"
    price = Faker::Commerce.price

    if @i > 0 && @i < 6
        gender = "mens"
    elsif @i > 6 && @i < 13
        gender = "womens"
    elsif @i > 13 && @i < 20
        gender = "kids"
    else
        gender = "neutral"
    end

    Product.create!(
        title:  title,
        description: description,
        image_file_file_name: "#{@i}.jpg",
        price: price,
        gender: gender
    )
end