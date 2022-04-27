# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(email: "admin@admin",
             password:  "testtest"
             )

User.create!(
  [
    {name: "Akira",introduction: "星景写真が好きです。よろしくお願いします!",email: "aa@aa",password: "abcde0000"},
    {name: "Ryota",introduction: "東北在住。星景写真が好きです。よろしくお願いします!",email: "bb@bb",password: "abcde0000"},
    {name: "John",introduction: "オーストラリア在住。星景写真が好きです。よろしくお願いします!",email: "cc@cc",password: "abcde0000"}
  ]
)

Tag.create!(
  [
    {name: '天の川'},
    {name: '人物'},
    {name: 'スタートレイル'}
  ]
)
