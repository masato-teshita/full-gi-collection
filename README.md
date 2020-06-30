# 古着コレクション
都内の古着屋の情報を掲載し、口コミを誰でも簡単に投稿できるサイトです。  
下記ページで公開中です。  
https://www.full-colle.com/

## アプリ概要
都内の古着屋を簡単に様々な角度から探せたり、店舗に対してユーザーのリアルな評価ができるアプリです。  
・都内にある古着屋を検索できる  
・買取、売却の口コミを点数付きで投稿する機能を実装  
・行ったお店、気になるお店をマイページで管理できる機能を実装  

作成した背景や想いなど、より詳細な情報は下記をご覧ください。  
[ポートフォリオ解説](https://qiita.com/masato-teshita/private/f1b6dc272c4c92681739)

## 機能
Ruby on Railsで制作したアプリです。
- 店舗検索機能(あいまい)　：店舗名や取り扱うブランド名など、入力したキーワードに合致する店舗をあいまい検索できます
- 店舗検索機能(エリア/ジャンル/取扱ブランド)　：店舗があるエリア、店舗のジャンル、店舗が取り扱うブランドを軸に店舗を検索できます
- SNSシェア機能　：店舗情報をFacebook、Twitter、LINEで簡単に共有できます
- マイページ機能　：行った店舗(口コミを投稿した店舗)、保存した店舗を一覧で確認できます
- 口コミ投稿・評価機能　：購入・買取の両面、5段階で店舗の評価を行えます

## 使い方
### 店舗検索
1. トップページの検索ボックスに任意の値を入力 or エリア・カテゴリ・ブランドを選択
2. 検索条件に該当する店舗をクリック
### 口コミ投稿
1. 画面右上の「ログイン」ボタンをクリック
2. テストユーザーで簡単ログイン（`※アカウント登録せずに機能を試したい方は こちら`をクリック）
3. 任意の店舗ページに移動→口コミページ→`口コミを投稿する`をクリック
4. 評価等を入力して投稿→点数が反映される

## ローカル環境へのインストール方法
```
$ git clone https://github.com/masato-teshita/full-gi-collection.git
$ cd full-gi-collection
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails db:seed
```

## その他
現在も開発を継続しており、順次実装予定です。  
実装予定の機能はIssuesよりご確認いただけます。  
https://github.com/masato-teshita/full-gi-collection/issues

## 作者
[田中 壮渡：Twitter](https://twitter.com/masato_teshita)  
mail to: [t68.tanaka.masato@gmail.com](mailto:t68.tanaka.masato@gmail.com)
