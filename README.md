# GitLab

## 設定

    cp dotenv-example .env
    vim .env

## 初期設定

- `docker-compose up -d` で起動。
- ログイン。
    - 初期パスワードは `root` / `5iveL!fe`

## 起動

    docker-compose up -d
    docker-compose logs -ft

## 停止

    docker-compose down

## mattermostプラグインインストール例

    wget https://github.com/wbernest/mattermost-plugin-rssfeed/releases/download/v0.2.0/rssfeed-0.2.0.tar.gz
    docker cp ./rssfeed-0.2.0.tar.gz gitlab_gitlab_1:/
    docker-compose exec gitlab bash
    su mattermost -c 'cd /opt/gitlab/embedded/service/mattermost; /opt/gitlab/embedded/bin/mattermost --config /var/opt/gitlab/mattermost/config.json plugin add /rssfeed-0.2.0.tar.gz'

