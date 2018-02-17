# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#ユーザー
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

49.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

#スキル
users = User.order(:created_at).take(6)
10.times do |i|
  name = "Skill-#{i+1}"
  users.each { |user| user.skills.create!(name: name) }
  
end

#＋1
users = User.order(:created_at).take(6)
users.each do |user|
  skills = Skill.where(user_id: user.id)
  skills.each do |skill|
    rnd = rand(20) + 1
    nums = [*(1..rnd)]
    nums.each do |n|
      skill.likes.create!(skill_id: skill.id, user_id: n)
    end
  end
end