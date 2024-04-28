# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
users = [
  { name: "Roy Mustang", email: "roy@fma.com", password: "bl@ck_hAyat3" },
  { name: "Rintaro Okabe", email: "okabe@gate.com", password: "kvrisv~tensh1" },
  { name: "Caped Baldy", email: "saitama@opm.com", password: "$up3r$@le" },
  { name: "Lelouch Lamperouge", email: "lelouch@geass.com", password: "G30ssTh3R3sist@nce" },
  { name: "Monkey D. Luffy", email: "luffy@strawhat.com", password: "P1rateK1ng" },
  { name: "Edward Elric", email: "edward@alchemy.com", password: "Ph1los0ph3rsSt0n3" },
  { name: "Naruto Uzumaki", email: "naruto@hokage.com", password: "B3li3veIt!" },
  { name: "Spike Spiegel", email: "spike@bebop.com", password: "C0wboyB3b0p" },
  { name: "Gon Freecss", email: "gon@hunt.com", password: "Hunt3rX" },
  { name: "Kaneki Ken", email: "kaneki@ghoul.com", password: "C3ntip3d3M@sk" }
]

# Create 10 posts with quotes
quotes = [
  "The world isn’t perfect. But it’s there for us, doing the best it can. That’s what makes it so damn beautiful.",
  "I will always love you, no matter which what time, or where I am. I’ll say it one more time. I love you.",
  "I’ll leave tomorrow’s problems to tomorrow’s me.",
  "I, Lelouch vi Britannia, command you!",
  "I'm going to be the Pirate King!",
  "A lesson without pain is meaningless. For you cannot gain something without sacrificing something else in return.",
  "I'm not gonna run away, I never go back on my word! That's my nindo: my ninja way!",
  "I'm not going there to die. I'm going to find out if I'm really alive.",
  "If you want to get to know someone, find out what makes them angry.",
  "It's not the world that's messed up; it's those of us in it."
]

# Create 10 comments
comments = [
  "This comment was made by Roy Mustang (Full Metal Alchemist)",
  "This comment was made by Okabe (Steins; Gate)",
  "This comment was made by Saitama (One-Punch Man)",
  "This comment was made by Lelouch Lamperouge (Code Geass)",
  "This comment was made by Monkey D. Luffy (One Piece)",
  "This comment was made by Edward Elric (Full Metal Alchemist)",
  "This comment was made by Naruto Uzumaki (Naruto)",
  "This comment was made by Spike Spiegel (Cowboy Bebop)",
  "This comment was made by Gon Freecss (Hunter x Hunter)",
  "This comment was made by Kaneki Ken (Tokyo Ghoul)"
]

tenant_keys = [
  "purrintables",
  "kurustudio",
  "boseriko",
]

tenant_domains = [
  ["purrintables.com"],
  ["kuru.studio", "server.kuru.studio", "social.kuru.studio"],
  ["boseriko.com"],
]

# Create tenants
tenants.each_with_index do |tenant, index|
  Tenant.create(api_key: tenant_keys[index], allowed_domains: tenant_domains[index])
end

# Create users and posts
users.each_with_index do |user, index|
  created_user = User.new(user)
  created_user.password_confirmation = user[:password]
  created_user.confirmed_at = Time.now
  current_user.tenant = Tenant.first
  created_user.save
  created_post = Post.create(content: quotes[index], user_id: created_user.id, tenant: Tenant.first)
  Comment.create(commentable: created_post, body: comments[index], user_id: created_user.id, tenant: Tenant.first)
end
