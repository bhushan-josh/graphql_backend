# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Seed Users, Posts, and Comments with realistic data using Faker
gem 'faker'
require 'faker'

User.destroy_all
Post.destroy_all
Comment.destroy_all

users = 5.times.map do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email
  )
end

users.each do |user|
  rand(3..4).times do
    post = user.posts.create!(
      title: Faker::Book.title,
      body: Faker::Lorem.paragraph(sentence_count: 5)
    )

    rand(2..3).times do
      commenter = users.sample
      post.comments.create!(
        body: Faker::Lorem.sentence(word_count: 10),
        user: commenter
      )
    end
  end
end

puts "Seeded #{User.count} users, #{Post.count} posts, and #{Comment.count} comments."
