## バージョン

```
rails: 6.1.7
ruby: 3.1.0
mysql: 8.0.31
```

## セットアップ

### インストールからサーバー起動まで

```sh
$ git clone git@github.com:masaki2001/photo_album.git
$ bundle install
$ brew install imagemagick

$ rails s
```

### MySQLのセットアップ

```sh
$ mysql.server start
$ mysql_secure_installation
$ mysql -u root -p

mysql> create user 'photo_album_user'@'localhost' identified by 'password';
mysql> grant all on *.* to 'photo_album_user'@'localhost';
```

（Sequel Pro等、DB GUI管理ツールを使用される場合は[こちら](https://qiita.com/ysk1o/items/7f0ca12ced72363f9448)を参考に認証プラグインを変更してください）

環境変数を`.env`ファイルに設定しております。

## その他

かかった時間：13時間

`7. 連携アプリケーションへツイートを投稿`の課題にて、ツイート投稿先のリクエストに対するレスポンスが500ステータスで返却されておりエラーメッセージも返ってこなかったため連携サービス先でのツイート投稿が確認できませんでした。
