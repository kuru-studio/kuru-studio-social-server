desc "drops the db, creates db, migrates db, and seeds the database"
task setup: ["db:drop", "db:create", "db:migrate", "db:seed"]
