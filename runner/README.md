# GitLab Runner

## 初期設定

- `docker-compose up -d` で起動。
- GitLabに管理者アカウントでログインし、Admin Area > Overview > Runnersを開きURLとトークンを控える。
  (URLは別マシンなら外部IPアドレスとかに。)
- 以下のコマンドを実行 (http://XXXX/ と XXXXのところを置き換える)

    docker-compose exec gitlab-runner gitlab-runner register \
        --non-interactive \
        --env http_proxy=$http_proxy \
        --env https_proxy=$https_proxy \
        --name gitlab-shared-runner \
        --url http://XXXX/ \
        --registration-token XXXX \
        --executor docker \
        --docker-privileged \
        --docker-image python:latest

## 起動

    docker-compose up -d
    docker-compose logs -ft

## 停止

    docker-compose down

