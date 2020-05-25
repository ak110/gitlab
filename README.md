# GitLab

## 構築

### 設定

    cp dotenv-example .env
    vim .env

### 初期設定

- `docker-compose up -d` で起動。
- ログイン。
    - 初期パスワードは `root` / `5iveL!fe`

### 起動

    docker-compose up -d
    docker-compose logs -ft

### 停止

    docker-compose down

### mattermostプラグインインストール例

    wget https://github.com/wbernest/mattermost-plugin-rssfeed/releases/download/v0.2.0/rssfeed-0.2.0.tar.gz
    docker cp ./rssfeed-0.2.0.tar.gz gitlab_gitlab_1:/
    docker-compose exec gitlab bash
    su mattermost -c 'cd /opt/gitlab/embedded/service/mattermost; /opt/gitlab/embedded/bin/mattermost --config /var/opt/gitlab/mattermost/config.json plugin add /rssfeed-0.2.0.tar.gz'

## 運用関連

### GitLab Container RegistryのGC

    docker-compose exec gitlab du -sh /var/opt/gitlab/gitlab-rails/shared/registry/
    docker-compose exec gitlab gitlab-ctl registry-garbage-collect -m
    docker-compose exec gitlab du -sh /var/opt/gitlab/gitlab-rails/shared/registry/

### リポジトリサイズの調査

    docker-compose exec gitlab bash -c 'du -sh /var/opt/gitlab/git-data/repositories/*/* | sort -h'

### バックアップ

    docker-compose exec gitlab gitlab-rake gitlab:backup:create
    docker-compose exec gitlab ls -l /var/opt/gitlab/backups

### バージョン更新

1. 上記手順でバックアップを取得する。
2. <https://hub.docker.com/r/gitlab/gitlab-ce/tags/> で最新バージョンを確認する。
3. <https://docs.gitlab.com/ee/policy/maintenance.html#upgrade-recommendations> で移行手順が無いか確認する。あればそれに従う。(大きくバージョン飛ばなきゃ大体大丈夫)
4. `docker-compose.yml` のイメージのバージョンを書き換える。
5. `./upgrade.sh` を実行する。(数分かかる。完了してもログは流れ続ける。)
6. アクセス可能になったらCtrl+Cで終了する。

