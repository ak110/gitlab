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

## GitLab Container RegistryのGC

    docker-compose exec gitlab du -sh /var/opt/gitlab/gitlab-rails/shared/registry/
    docker-compose exec gitlab gitlab-ctl registry-garbage-collect -m
    docker-compose exec gitlab du -sh /var/opt/gitlab/gitlab-rails/shared/registry/

## mattermostプラグインインストール例

    wget https://github.com/wbernest/mattermost-plugin-rssfeed/releases/download/v0.2.0/rssfeed-0.2.0.tar.gz
    docker cp ./rssfeed-0.2.0.tar.gz gitlab_gitlab_1:/
    docker-compose exec gitlab bash
    su mattermost -c 'cd /opt/gitlab/embedded/service/mattermost; /opt/gitlab/embedded/bin/mattermost --config /var/opt/gitlab/mattermost/config.json plugin add /rssfeed-0.2.0.tar.gz'

## バックアップ

    docker-compose exec gitlab gitlab-rake gitlab:backup:create
    docker-compose exec gitlab ls -l /var/opt/gitlab/backups

## 最新タグの確認

<https://hub.docker.com/r/gitlab/gitlab-ce/tags/>
