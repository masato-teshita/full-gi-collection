areas = Area.create([
  {name: '下北沢'},
  {name: '渋谷'},
  {name: '高円寺'},
  {name: '原宿'},
  {name: '中目黒'},
  {name: '吉祥寺・三鷹'},
  {name: '新宿・代々木・新大久保'},
  {name: '高田馬場・池袋'},
  {name: '中野'}
])

genres = Genre.create([
  {name: 'ブランド古着', image: 'genres/genre_brand-furugi.jpg'},
  {name: '80s90s', image: 'genres/genre_80s90s-furugi.jpg'},
  {name: 'ミリタリー古着', image: 'genres/genre_military-furugi.jpg'},
  {name: 'ノーブランド古着', image: 'genres/genre_no-brand-furugi.jpg'},
  {name: 'リユースショップ', image: 'genres/genre_reuse-shop-furugi.jpg'},
  {name: 'ヴィンテージ古着', image: 'genres/genre_vintage-furugi.jpeg'},
])

users = User.create([
  {name: '壮', admin: 'true', email: 'paru.koaremina2928@gmail.com', password: '111111', password_confirmation: '111111'},
  {name: 'テストユーザ', admin: 'false', email: 'test-user@teshita.jp', password: '123456', password_confirmation: '123456'},
])

require "csv"

# ブランドデータ投入
CSV.foreach('db/csv/seed_brands.csv', headers: true) do |row|
  Brand.create(
    name: row['name'],
    image: row['image'],
  )
end

# 店舗データ投入
CSV.foreach('db/csv/seed_shops.csv', headers: true) do |row|
  Shop.create(
    name: row['name'],
    area_id: row['area_id'],
    address: row['address'],
    postal_code: row['postal_code'],
    outline: row['outline'],
  )
end

# 店舗ーブランド中間データ投入
CSV.foreach('db/csv/seed_shop_brands.csv', headers: true) do |row|
  ShopBrand.create(
    shop_id: row['shop_id'],
    brand_id: row['brand_id'],
  )
end

# 店舗ージャンル中間データ投入
CSV.foreach('db/csv/seed_shop_genres.csv', headers: true) do |row|
  ShopGenre.create(
    shop_id: row['shop_id'],
    genre_id: row['genre_id'],
  )
end

shop_images = ShopImage.create([
  {shop_id: 1, shop_image: open("#{Rails.root}/db/fixtures/buzzstore_simokita_north.jpg")},
  {shop_id: 2, shop_image: open("#{Rails.root}/db/fixtures/buzzstore_simokita_sourth.jpg")},
  {shop_id: 3, shop_image: open("#{Rails.root}/db/fixtures/KILLvintageclothing.jpg")},
  {shop_id: 4, shop_image: open("#{Rails.root}/db/fixtures/buzzstore_shibuya.jpg")},
  {shop_id: 5, shop_image: open("#{Rails.root}/db/fixtures/2nd-street_shibuya.jpg")},
  {shop_id: 6, shop_image: open("#{Rails.root}/db/fixtures/gate-1.jpg")},
  {shop_id: 7, shop_image: open("#{Rails.root}/db/fixtures/play-back.jpg")},
  {shop_id: 8, shop_image: open("#{Rails.root}/db/fixtures/santonibunnoichi.jpeg")},
  {shop_id: 9, shop_image: open("#{Rails.root}/db/fixtures/replay.jpg")},
  {shop_id: 10, shop_image: open("#{Rails.root}/db/fixtures/dondondown_koenji.jpg")},
  {shop_id: 11, shop_image: open("#{Rails.root}/db/fixtures/2nd-street_koenji.jpg")},
  {shop_id: 12, shop_image: open("#{Rails.root}/db/fixtures/hosu.jpg")},
  {shop_id: 13, shop_image: open("#{Rails.root}/db/fixtures/中目黒THEVINTAGEHOOK.jpg")},
  {shop_id: 14, shop_image: open("#{Rails.root}/db/fixtures/buzzstore_mitaka.jpg")},
  {shop_id: 15, shop_image: open("#{Rails.root}/db/fixtures/原宿CHICAGO吉祥寺店.jpg")},
  {shop_id: 16, shop_image: open("#{Rails.root}/db/fixtures/RAGTAG_shinjuku.jpg")},
  {shop_id: 17, shop_image: open("#{Rails.root}/db/fixtures/buzzstore_takadanobaba.jpg")},
  {shop_id: 18, shop_image: open("#{Rails.root}/db/fixtures/bazzstore_numabukuro.jpg")},
  {shop_id: 19, shop_image: open("#{Rails.root}/db/fixtures/buzzstore_harajuku.jpg")},
  {shop_id: 20, shop_image: open("#{Rails.root}/db/fixtures/A-1CLOTHING.jpg")},
  {shop_id: 21, shop_image: open("#{Rails.root}/db/fixtures/BRANDCOLLECT原宿竹下通り店.jpg")},
  {shop_id: 22, shop_image: open("#{Rails.root}/db/fixtures/SantaMonica原宿店.jpg")},
  {shop_id: 23, shop_image: open("#{Rails.root}/db/fixtures/VALON.jpg")},
  {shop_id: 24, shop_image: open("#{Rails.root}/db/fixtures/USEDCLOTHINGANTON.jpg")},
  {shop_id: 25, shop_image: open("#{Rails.root}/db/fixtures/NEWYORKJOEEXCHANGE下北沢店.jpg")},
  {shop_id: 26, shop_image: open("#{Rails.root}/db/fixtures/FLAMINGO下北沢マバタキ店.jpg")},
  {shop_id: 27, shop_image: open("#{Rails.root}/db/fixtures/HIGH_LOW.jpg")},
  {shop_id: 28, shop_image: open("#{Rails.root}/db/fixtures/RAGTAG下北沢店.jpg")},
  {shop_id: 29, shop_image: open("#{Rails.root}/db/fixtures/BAZZSTORE高円寺パル商店街店.jpg")},
  {shop_id: 30, shop_image: open("#{Rails.root}/db/fixtures/Antler.jpg")},
  {shop_id: 31, shop_image: open("#{Rails.root}/db/fixtures/Kissmet.jpg")},
  {shop_id: 32, shop_image: open("#{Rails.root}/db/fixtures/突撃洋服店.jpg")},
  {shop_id: 33, shop_image: open("#{Rails.root}/db/fixtures/ragtag-shibuya.jpg")},
  {shop_id: 34, shop_image: open("#{Rails.root}/db/fixtures/OFO.png")},
  {shop_id: 35, shop_image: open("#{Rails.root}/db/fixtures/qosmos.jpg")},
  {shop_id: 36, shop_image: open("#{Rails.root}/db/fixtures/RAGTAG吉祥寺店.jpg")},
  {shop_id: 37, shop_image: open("#{Rails.root}/db/fixtures/セカンドストリート吉祥寺サンロード店.jpg")},
  {shop_id: 38, shop_image: open("#{Rails.root}/db/fixtures/SantaMonica吉祥寺店.jpg")},
  {shop_id: 39, shop_image: open("#{Rails.root}/db/fixtures/Kindal新宿店ANNEX.jpg")},
  {shop_id: 40, shop_image: open("#{Rails.root}/db/fixtures/RINKAN新宿店.jpg")},
  {shop_id: 41, shop_image: open("#{Rails.root}/db/fixtures/REDCLOUD.jpeg")},
  {shop_id: 42, shop_image: open("#{Rails.root}/db/fixtures/Dron-pa.jpeg")},
  {shop_id: 43, shop_image: open("#{Rails.root}/db/fixtures/たんぽぽ.jpeg")},
  {shop_id: 44, shop_image: open("#{Rails.root}/db/fixtures/リサイクルブティックＡＢＣ中野店.jpg")},
  {shop_id: 45, shop_image: open("#{Rails.root}/db/fixtures/tifana.jpg")},
])