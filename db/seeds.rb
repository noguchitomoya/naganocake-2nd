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

EndUser.create!(
    email: "111@111",
    password: "11111111",
    last_name: "樋口",
    first_name: "一葉",
    last_name_kana: "ヒグチ",
    first_name_kana: "イチヨウ",
    postal_code: "9880933",
    address: "東京都新宿３丁目",
    telephone_number: "09012244534",
    is_active: true
)

EndUser.create!(
    email: "222@222",
    password: "22222222",
    last_name: "徳川",
    first_name: "家康",
    last_name_kana: "トクガワ",
    first_name_kana: "イエヤス",
    postal_code: "3421123",
    address: "茨城県水戸市",
    telephone_number: "09012246879",
    is_active: true
)

Address.create!(
    end_user_id: 1,
    name: "佐藤くん",
    postal_code: "7776732",
    address: "アメリカ合衆国オハイオ州"
)

Address.create!(
    end_user_id: 1,
    name: "山口くん",
    postal_code: "2231234",
    address: "岩手県岩手し"
)

Address.create!(
    end_user_id: 1,
    name: "小松くん",
    postal_code: "2423344",
    address: "埼玉県大宮市"
)
