# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Post.create(content: "The world isn’t perfect. But it’s there for us, doing the best it can. That’s what makes it so damn beautiful. — Roy Mustang (Full Metal Alchemist)")
Post.create(content: "I will always love you, no matter which what time, or where I am. I’ll say it one more time. I love you. — Okabe (Steins; Gate)")
Post.create(content: "I’ll leave tomorrow’s problems to tomorrow’s me. – Saitama (One-Punch Man)")

User.create(name: "Roy Mustang", email: "roy@fma.com", password: "bl@ck_hAyat3")
User.create(name: "Rintaro Okabe", email: "okabe@gate.com", password: "kvrisv~tensh1")
User.create(name: "Caped Baldy", email: "saitama@opm.com", password: "$up3r$@le")
