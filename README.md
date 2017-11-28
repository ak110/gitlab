# GitLab

## ビルド

    cp docker-compose.yml.example docker-compose.yml
    vim docker-compose.yml
    docker-compose build --build-arg=http_proxy=$http_proxy --build-arg=https_proxy=$https_proxy gitlab

## 起動

    docker-compose up -d
    docker logs gitlab -f

## 停止

    docker-compose down

