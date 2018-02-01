# README

Rails + devise で会員登録APIを作るサンプル

### バージョン
* docker: 17.12.0-ce
* docker-compose: 1.18.0

### セットアップ

```
$ git clone git@github.com:sakamot/devise_test.git
$ docker-compose up
```

ブラウザから`localhost:3000/`にアクセス

### 会員登録APIリクエスト例

```
$ curl -H 'Content-Type:application/json' -d '{"email": "test@test.com", "password": "123456"}' http://localhost:3000/api/users/sign_up
```

