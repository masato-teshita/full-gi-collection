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

brands = Brand.create([
  {name: 'yohji yamamoto', image: 'brands/brand-yohjiyamamoto.jpg'},
  {name: 'Acne Studios', image: 'brands/brand-acne.jpeg'},
  {name: 'ANN DEMEULEMEESTER', image: 'brands/brand-ANN DEMEULEMEESTER.jpeg'},
  {name: 'AURALEE', image: 'brands/brand-AURALEE.jpg'},
  {name: 'BALENCIAGA', image: 'brands/brand-balenciaga.png'},
  {name: 'COMOLI', image: 'brands/brand-comoli.png'},
  {name: 'COMME des GARÇONS', image: 'brands/brand-garcons.jpg'},
  {name: 'Hender Scheme', image: 'brands/brand-hender-scheme.png'},
  {name: 'HOMME PLISSÉ ISSEY MIYAKE', image: 'brands/brand-hommeplisse.jpg'},
  {name: 'ISSEY MIYAKE MEN', image: 'brands/brand-isseymiyakemen.jpg'},
  {name: 'KENZO', image: 'brands/brand-kenzo.png'},
  {name: 'MAISON KITSUNÉ', image: 'brands/brand-kitsune.png'},
  {name: 'lucien pellat-finet', image: 'brands/brand-lucien pellat-finet.jpg'},
  {name: 'Maison Margiela', image: 'brands/brand-maisonmargiela.png'},
  {name: 'MARGARET HOWELL', image: 'brands/brand-margaret-howell.jpg'},
  {name: 'MARNI', image: 'brands/brand-marni.png'},
  {name: 'RAF SIMONS', image: 'brands/brand-raf-simons.jpeg'},
  {name: 'SUN SEA', image: 'brands/brand-sunsea.jpg'},
  {name: 'UNDERCOVER', image: 'brands/brand-UNDERCOVER.jpg'},
  {name: 'UNUSED', image: 'brands/brand-unused.jpg'},
  {name: 'Y-3', image: 'brands/brand-y-3.jpg'},
  {name: 'DIGAWEL', image: 'brands/brand-digawel.png'},
  {name: 'DRIES VAN NOTEN', image: 'brands/brand-dreisvannoten.jpeg'},
  {name: 'ETHOSENS', image: 'brands/brand-ethosens.png'},
  {name: 'FACETASM', image: 'brands/brand-facetasm.png'},
  {name: 'G.V.G.V.', image: 'brands/brand-GVGV.jpg'},
  {name: 'GIVENCHY', image: 'brands/brand-Givenchy.png'},
  {name: 'HYSTERIC GLAMOUR', image: 'brands/brand-HYSTERICGLAMOUR.jpg'},
  {name: 'JOHN LAWRENCE SULLIVAN', image: 'brands/brand-johnlawrencesullivan.jpg'},
  {name: 'JUNYA WATANABE COMME des GARÇONS', image: 'brands/brand-junyawatanabe.jpg'},
  {name: 'kolor', image: 'brands/brand-kolor.png'},
  {name: 'LAD MUSICIAN', image: 'brands/brand-LAD.jpg'},
  {name: 'LIMI feu', image: 'brands/brand-limifeu.jpg'},
  {name: 'N.HOOLYWOOD', image: 'brands/brand-NHOOLYWOOD.png'},
  {name: 'Name.', image: 'brands/brand-name.png'},
  {name: 'OFF-WHITE', image: 'brands/brand-off-white.png'},
  {name: 'Paul Smith', image: 'brands/brand-PaulSmith.jpeg'},
  {name: 'Rick Owens', image: 'brands/brand-RickOwens.png'},
  {name: 'sacai', image: 'brands/brand-sacai.png'},
  {name: 'TOGA', image: 'brands/brand-TOGA.jpg'},
  {name: 'TOM FORD', image: 'brands/brand-TOMFORD.jpg'},
  {name: 'visvim', image: 'brands/brand-visvim.png'},
  {name: 'Vivienne Westwood', image: 'brands/brand-Vivienne Westwood.jpg'},
  {name: 'WACKO MARIA', image: 'brands/brand-WACKOMARIA.jpg'},
  {name: 'Whitehouse Cox', image: 'brands/brand-shitehousecox.jpg'},
  {name: 'XLARGE', image: 'brands/brand-XLARGE.gif'},
  {name: "Y's", image: 'brands/brand-ys.png'},
  {name: 'YAECA', image: 'brands/brand-YAECA.png'},
  {name: '3.1 Phillip Lim', image: 'brands/brand-31PhillipLim.png'},
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

shops = Shop.create([
  {
    name: 'BAZZSTORE下北沢北口店※現:東口',
    postal_code: '155-0031',
    address: '東京都世田谷区北沢2-31-3' ,
    area_id: '1',
    outline: '古着の聖地、下北沢駅の北口を出て、徒歩2分ほどの場所にお店を構えるバズストア。
    中2階の比較的広い店内は品揃えが非常に豊富で、そのお店の商品数はなんと5,000点以上あるとのこと。
    買取に来る人もとても多く、毎日多くの新商品が入荷、新商品は通販サイトでも見られるという毎日チェックしたくなる古着屋ですね。
    しかも買取については某下北沢エンターテイメント情報誌に掲載される程、買取価格に定評があるようです。
    商品も訪れる度にどんどん変わっているようにみえます。
    商品数も納得の通い甲斐のある飽きの来ないお店です。
    営業時間は12:00〜22:00までと、比較的遅くまで営業しているので仕事帰りでも立ち寄れちゃいます。',
    shop_images_attributes: [{
      shop_image: open("#{Rails.root}/db/fixtures/buzzstore_simokita_north.jpg")
    }]
  },
  {
    name: 'BAZZSTORE下北沢南口店※現:南西口',
    postal_code: '155-0031',
    address: '東京都世田谷区北沢2-11-4' ,
    area_id: '1',
    outline: '下北沢南口店は、下北沢北口店に次ぐ、下北沢で二店舗目の展開。北口店同様に古着全般の販売、買取を行っています。販売に関しても、メンズ、レディース共に豊富なブランド品からお手頃な値段の商品を多数取り揃えています。
    古着の聖地とも呼ばれる下北沢ならではのおしゃれなアイテムが手に入ること間違いなしでしょう。アクセスは、京王井の頭線・小田急線「下北沢駅」から徒歩1分 営業時間は12:00～22:00で、年中無休。',
    shop_images_attributes: [{
      shop_image: open("#{Rails.root}/db/fixtures/buzzstore_simokita_sourth.jpg")
    }]
  },
  {
    name: 'KILL vintage clothing（キルビンテージクローシング）',
    postal_code: '155-0032',
    address: '東京都世田谷区代沢5-30-3',
    area_id: '1',
    outline: '古着のメッカ下北沢にある古着屋兼ギャラリー。ヨーロッパやアメリカから仕入れたヴィンテージもののブランド古着を主に取り扱っている。確かな感性で選び抜かれた古着の数々は見ているだけでも楽しくなると評判で、とくに女性客から支持を受けている。',
    shop_images_attributes: [{
      shop_image: open("#{Rails.root}/db/fixtures/KILLvintageclothing.jpg")
    }]
  },
  {
    name: 'BAZZSTORE渋谷ファイヤー通り店',
    postal_code: '150-0041',
    address: '東京都渋谷区神南１丁目１２−１４ 渋谷宮田ビル 2F',
    area_id: '2',
    outline: 'この渋谷ファイヤー通り店では、古着全般の販売と買い取りを行っています。販売ではメンズとレディースの両方を扱っていて、ウェアを中心に、バッグ、シューズ、アクセサリー、ファッション小物まで取り揃えられているのです。
    渋谷という場所柄、新しいブランド品の数が豊富、またスケートボードにバックパックなどもあるので、アウトドア系のアイテムも充実。買い取りについては、見積もりだけでも随時受け付けているので、まずは一度持ち込んでみるのがオススメです。
    アクセスは、JR・各線『渋谷駅』から徒歩5分。営業時間は12:00～22:00で、年中無休。',
    shop_images_attributes: [{
      shop_image: open("#{Rails.root}/db/fixtures/buzzstore_shibuya.jpg")
    }]
  },
  {
    name: 'セカンドストリート渋谷神南店（旧称：JUMBLE STORE）',
    postal_code: '150-0041',
    address: '東京都渋谷区神南1丁目22番9号 サンクスビル1・2F',
    area_id: '2',
    outline: '渋谷神南店では、メンズとレディースのファッションアイテムに、高価なスーパーブランドを取り扱っています。店内は、明るい照明の下、ホワイトの壁で統一された内装が、清潔感のある内装です。
    店頭に置いてあるアイテム数は、とても多いみたいですが、キチンと整理されているため、店内をじっくりと見て回れる内装です。渋谷駅から近いことから、やや若者向けのアイテムが多いみたい。
    トップス、ボトム、シューズなど、アイテムによって分けて置かれていることから、コーディネートがしやすく、またお求めのアイテムを探しやすい店内です。
    アクセスは、JR・各線『渋谷駅』から徒歩5分。営業時間は11:00～22:00で、年中無休。',
    shop_images_attributes: [{
      shop_image: open("#{Rails.root}/db/fixtures/2nd-street_shibuya.jpg")
    }]
  },
  {
    name: 'GATE-1',
    postal_code: '155-0031',
    address: '東京都世田谷区北沢２丁目１−１０',
    area_id: '1',
    outline: 'ヨーロッパから仕入れたミリタリーウェアが所狭しと並ぶ「GATE-1」。デッドストック品を多く取り扱っているため、どの商品も質が高く古着を感じさせません。
    けれど、古い物が持つ独特の味わいはしっかりとあり、どの商品からも「質の高さ」と「古着らしい味」の双方が存在しています。驚きなのはそのお値段！希少なものも手の届く価格で提供されていますよ。
    中には自社でリメイクや染めを行った商品も。型は同じものでもそれぞれ風合いの異なる1着に仕上がっています。',
    shop_images_attributes: [{
      shop_image: open("#{Rails.root}/db/fixtures/gate-1.jpg")
    }]
  },
  {
    name: 'PLAY BACK VINTAGE STORE（プレイバック ヴィンテージストア）',
    postal_code: '150-0001',
    address: '東京都渋谷区神宮前３丁目２４−６',
    area_id: '4',
    outline: '原宿・明治通り沿いに店を構えるヴィンテージショップ。アメリカで直接買い付けたアイテムをゆったりとした店内で選べるのが嬉しい。2018年6月27日にリニューアルオープン。',
    shop_images_attributes: [{
      shop_image: open("#{Rails.root}/db/fixtures/play-back.jpg")
    }]
  },
  {
    name: 'サントニブンノイチ 原宿店',
    postal_code: '150-0001',
    address: '東京都渋谷区神宮前４丁目２６−２８',
    area_id: '4',
    outline: '原宿で一際目立つピンク、ブルー、イエローの配色のビル。そのイエローの3Fにあるのが「サントニブンノイチ原宿」。通称・サンニブ。
    大阪発祥の人気古着ショップ「サントニブンノイチ」の初東京進出店として、人気を集めている。スタッフ全員が雑誌などに活躍する人ばかりで、JAMモデルのゆうたろうと藤田日和も「サントニブンノイチ」のショップスタッフである。特にゆうたろうの出勤日には、外まで行列が伸びることも！',
    shop_images_attributes: [{
      shop_image: open("#{Rails.root}/db/fixtures/santonibunnoichi.jpeg")
    }]
  },
  {
    name: 'Replay（リプレイ）',
    postal_code: '166-0003',
    address: '東京都杉並区高円寺南３丁目５６−１',
    area_id: '3',
    outline: '高円寺にある「Replay（リプレイ）」にはカジュアルアイテムの古着がたくさん揃っています。パーカーやトレーナー、Tシャツ、スニーカーなどです。
    メンズもの、ユニセックスものが中心で、レディース専用のもの（フリルデザインやワンピースなど）は見受けられませんでした。商品のデザインは、やはり男性が好みそうなものが多かったですが、女性好みのかわいいプリントが入っているものもありました。
    パーカーが数多く揃っています！サイズについては、小さめのものの中にはインポートのキッズサイズも含まれているとのことです。あと、ちょっとだけでしたが子供向けの古着も取り扱いがありました。',
    shop_images_attributes: [{
      shop_image: open("#{Rails.root}/db/fixtures/replay.jpg")
    }]
  },
  {
    name: 'ドンドンダウン高円寺店',
    postal_code: '166-0003 ', 
    address: '東京都杉並区高円寺南４丁目２４−９ 2・3階',
    area_id: '3',
    outline: '国内外約５０店舗を展開するリサイクル古着屋
    毎週水曜日と言えばドンドン値下り
    ドンな服でもドンドン買取
    服を買うなら&売るならドンドンダウン！',
    shop_images_attributes: [{
      shop_image: open("#{Rails.root}/db/fixtures/dondondown_koenji.jpg")
    }]
  },
  {
    name: 'セカンドストリート高円寺店',
    postal_code: '166-0003', 
    address: '東京都杉並区高円寺南４丁目６−７',
    area_id: '3',
    outline: '【新型コロナウイルス感染症拡大防止対策による営業時間変更のお知らせ】

    いつもセカンドストリートをご利用頂きまして、ありがとうございます。
    誠に勝手ではございますが、通常とは異なる下記内容にて営業させて頂きます。
    
    ■5月7日（木）～当面の間　10：00～20：00
    また、予告なく臨時休業及び営業時間の変更となる場合もございますのでご了承ください。
    
    ご不便お掛け致しますが、ご理解のほど宜しくお願い致します。',
    shop_images_attributes: [{
      shop_image: open("#{Rails.root}/db/fixtures/2nd-street_koenji.jpg")
    }]
  },
  {
    name: 'HOSU（ホス）',
    postal_code: '153-0042',
    address: '東京都目黒区青葉台１丁目２１−11 104',
    area_id: '5',
    outline: '【HOSU】は、中目黒で発祥したアパレルブランドを展開するショップです。中目黒店の他に、岡山県にも系列店があります。
    メンズのアイテムを中心に、カジュアルヴィンテージ感のあるトップス、デニム、またブーツなどに力を入れて展開しているみたいです。
    地元・中目黒のイベントに協賛したり、ハンドメイドブランドや、アパレルブランドともコラボしたりなど、ファッション関連の行事を積極的に展開しています。
    ショップの外観は、優しいホワイトを基調とした壁に、爽やかな青色枠の入り口が印象的です。店内に入ると、スチールで出来たシンプルな棚を有効活用しながら、所々にアンティーク調の棚や雑貨がディスプレイされていて、かなりハイセンスな造りになっています。
    特に、ホワイトとブルーの組み合わせがポイントになっているデザインが目立ちます。
    アクセスは、東急東横線『中目黒駅』から徒歩5分。営業時間は、日曜から木曜が12:00～20:00、金曜と土曜が12:00～21:00です。',
    shop_images_attributes: [{
      shop_image: open("#{Rails.root}/db/fixtures/hosu.jpg")
    }]
  },
  {
    name: '中目黒THE VINTAGE HOOK（ザ・ヴィンテージ フック）',
    postal_code: '153-0042',
    address: '東京都目黒区青葉台１丁目１４−２ 1F',
    area_id: '5',
    outline: '「Go Back 90’s Style」というキャッチコピーを掲げ、ヴィンテージ ハーレーアイテムを中心とした90年台のオールドスケート、ロック等のアイテムを取り扱っている。
    デッドストックやスペシャルヴィンテージを中心としているため、誰にも真似できない個性的なファッションを目指しているなら一度は覗きたいお店だ。

    通販サイトがあるので全国から利用可能。店舗は東急東横線中目黒駅から徒歩8分。桜並木で有名な目黒川のそばにある。',
    shop_images_attributes: [{
      shop_image: open("#{Rails.root}/db/fixtures/中目黒THEVINTAGEHOOK.jpg")
    }]
  },
  {
    name: 'BAZZSTORE三鷹北口店（バズストア）', 
    postal_code: '180-0006', 
    address: '東京都武蔵野市中町５−５ 2-5-24 中嶋ビル 1F', 
    area_id: '6', 
    outline: '古着のメッカ吉祥寺の隣駅、三鷹駅近くにあるBAZZSTORE三鷹北口店では、高級ブランドからノンブランド品まで幅広いファッションアイテムを対象に古着全般の販売と買い取りを行っています。
    販売ではメンズとレディースの両方を扱っており、衣料品を中心に、バッグ、シューズ、アクセサリー、ファッション小物まで取りそろえられています。
    店舗の外にもお買い得商品がずらりと並んでおり、通りすがりについつい足を止めてしまう人も多いです。',
    shop_images_attributes: [{
      shop_image: open("#{Rails.root}/db/fixtures/buzzstore_mitaka.jpg")
    }]
  },
  {
    name: '原宿CHICAGO吉祥寺店（シカゴ）', 
    postal_code: '180-0004', 
    address: '東京都武蔵野市吉祥寺本町２丁目１３−６', 
    area_id: '6',
    outline: '原宿、下北沢などにも店舗のある有名古着ショップの吉祥寺店です。

    場所は東急百貨店のすぐ裏なので駅からも近くて立ち寄りやすいです。
    
    店内はこれぞ古着屋といった感じで、アメカジ、ヨーロッパ古着、カジュアル、ミリタリー、フォーマルといった様々なジャンルで、雑貨やシューズなども取り揃えてあり値段も手頃で幅広い年齢層の方におすすめです。
    メンズ、レディースはもちろんですが、古着屋にしては珍しく子供服も置いてあるので小さいお子さんがいる方もカワイイ服が見つかると思います。',
    shop_images_attributes: [{
      shop_image: open("#{Rails.root}/db/fixtures/原宿CHICAGO吉祥寺店.jpg")
    }]
  },
  {
    name: 'RAGTAG新宿店（ラグタグ）', 
    postal_code: '160-0022', 
    address: '東京都新宿区新宿３丁目３２−１０ Ｔ＆Ｔビル ４Ｆ', 
    area_id: '7', 
    outline: 'JR各線・小田急線・京王線・京王新線・西武新宿線・東京メトロ大江戸線・都営地下鉄新宿線「新宿」駅東南口より徒歩4分または東口より徒歩5分／東京メトロ丸の内線・副都心線「新宿三丁目」駅A4出口より徒歩2分',
    shop_images_attributes: [{
      shop_image: open("#{Rails.root}/db/fixtures/RAGTAG_shinjuku.jpg")
    }]
  },
  {
    name: 'BAZZSTORE 高田馬場早稲田通り西口店(バズストア)', 
    postal_code: '169-0075', 
    address: '東京都新宿区高田馬場４丁目１１−１０ kaleido 1F VORT', 
    area_id: '8', 
    outline: '渋谷や下北沢など、東京都内の主要な古着のメッカに多数の店舗を展開するBAZZSTOREの12号店。各線高田馬場駅より徒歩3分とアクセスがよく、営業時間も12:00～22:00までと遅くまで開店しているため立ち寄りやすいお店です。
    古着の買取にも対応をしており、高級ブランドだけでなく、ノンブランド品やカジュアルブランド、ファストファッションもOK。',
    shop_images_attributes: [{
      shop_image: open("#{Rails.root}/db/fixtures/buzzstore_takadanobaba.jpg")
    }]
  },
  {
    name: 'BAZZSTORE 沼袋店', 
    postal_code: '165-0025', 
    address: '東京都中野区沼袋３丁目４−１８ 三丁目ビル 2F', 
    area_id: '9', 
    outline: 'まず目を引くのが品揃えの豊富さです。ジャンルやブランドを問わず、メンズ・レディースから小物まで幅広く取り揃えています。
    全身をオシャレにコーディネートしたいという人におすすめのお店です。その上、状態の良い物が多いので、長期間使用できるのも魅力といえます。
    また、駅からのアクセスも抜群で改札を出てすぐにお店があるので、迷うこと無くたどり着くことができるのもおすすめポイントです。',
    shop_images_attributes: [{
      shop_image: open("#{Rails.root}/db/fixtures/bazzstore_numabukuro.jpg")
    }]
  },
])