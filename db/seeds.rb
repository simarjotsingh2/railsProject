# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

# Create Users
10.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email
  )
end

# Create Tags
tags = [ "Technology", "Education", "Health", "Sports", "Entertainment" ]
tags.each { |tag| Tag.create(name: tag) }

# Create Posts
User.all.each do |user|
  5.times do
    post = user.posts.create(
      title: Faker::Lorem.sentence,
      content: Faker::Lorem.paragraph
    )
    post.tags << Tag.order("RANDOM()").first
  end
end
