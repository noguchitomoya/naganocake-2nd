# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: "a@a",
    password: "aaaaaa"
)

Genre.create!(
    name: "デザート" ,
    is_active: true
)

Genre.create!(
    name: "焼肉",
    is_active: true
)

Genre.create!(
    name: "ジュース",
    is_active: true
)

Genre.create!(
    name: "中華料理",
    is_active: true
)

Item.create!(
    genre_id: 1,
    name: "プッチンプリン",
    introduction: "プルプル",
    price: 350,
    is_active: true
)

Item.create!(
    genre_id: 2,
    name: "ハート",
    introduction: "さっぱりホルモン",
    price: 650,
    is_active: true
)

Item.create!(
    genre_id: 3,
    name: "リアルゴールド",
    introduction: "シュワシュワ",
    price: 130,
    is_active: true
)

Item.create!(
    genre_id: 4,
    name: "麻婆豆腐",
    introduction: "すごい辛い",
    price: 500,
    is_active: true
)