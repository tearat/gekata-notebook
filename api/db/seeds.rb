# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
  {
    id: 1,
    username: "qwe",
    email: "qwe@qwe.qwe",
    encrypted_password: "$2a$12$7w9sxNCmGKkGtf3klhX3iO9qVw4SCpTQQ5pSpR.LROmcCIajAX17u",
    authentication_token: "HXA78sS3wsgBM_fzdrQq",
    reset_password_token: nil,
    reset_password_sent_at: nil,
    remember_created_at: nil,
  }
])

Type.create([
  { id: 1, title: "Programming" },
  { id: 2, title: "Book" },
])

Tag.create([
  { id: 1, title: "mySQL", type_id: 1 },
  { id: 2, title: "Ruby", type_id: 1 },
  { id: 3, title: "JS", type_id: 1 },
  { id: 4, title: "Shining", type_id: 2 },
])

Article.create([
  { id: 1, title: "mySQL settings", tag_id: 1, body: "Lorem ipsum.", user_id: 1, hidden: 0 },
  { id: 2, title: "Ruby on Rails", tag_id: 2, body: "Lorem ipsum.", user_id: 1, hidden: 0 },
  { id: 3, title: "JS secret scrolls", tag_id: 3, body: "Lorem ipsum.", user_id: 1, hidden: 1 },
  { id: 4, title: "Shin's article", tag_id: 4, body: "Lorem ipsum.", user_id: 1, hidden: 0 },
])
