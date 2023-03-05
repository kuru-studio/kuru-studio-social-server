# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create(name: "Roy Mustang", email: "roy@fma.com", password: "bl@ck_hAyat3")
second_user = User.create(name: "Rintaro Okabe", email: "okabe@gate.com", password: "kvrisv~tensh1")
third_user = User.create(name: "Caped Baldy", email: "saitama@opm.com", password: "$up3r$@le")

Post.create(
  content: "The world isn’t perfect. But it’s there for us, doing the best it can. That’s what makes it so damn beautiful. — Roy Mustang (Full Metal Alchemist)",
  user_id: first_user.id
)
Post.create(
  content: "I will always love you, no matter which what time, or where I am. I’ll say it one more time. I love you. — Okabe (Steins; Gate)",
  user_id: second_user.id
)
Post.create(
  content: "I’ll leave tomorrow’s problems to tomorrow’s me. – Saitama (One-Punch Man)",
  user_id: third_user.id
)
