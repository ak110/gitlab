# GitLab

## 設定

    cp dotenv-example .env
    vim .env

## 初期設定

- `docker-compose up -d` で起動。
- ログイン。
    - 初期パスワードは `root` / `5iveL!fe`
- Admin Area > Overview > Runnersを開き、URLとトークンを控える。
- `docker-compose exec gitlab-runner gitlab-runner register` を実行
    - 入力例:
    - gitlab-ci coordinator URL: `http://gitlab:40108/`
    - gitlab-ci token: `GitLabの画面に表示されているもの`
    - gitlab-ci description: `(任意)`
    - gitlab-ci tags: `(入力しない)`
    - executor: `docker`
    - default Docker image: `ruby:2.1`

## 起動

    docker-compose up -d
    docker-compose logs -ft

## 停止

    docker-compose down

