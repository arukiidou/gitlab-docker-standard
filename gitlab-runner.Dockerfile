#インストール時点の最新版にすることを推奨。うまく動作しない場合はubuntuにすること。
#https://hub.docker.com/r/gitlab/gitlab-runner/tags?page=1&ordering=last_updated

ARG IMAGE_VERSION=ubuntu-v13.10.0
ARG PROXY_URL

FROM gitlab/gitlab-runner:${IMAGE_VERSION}

ENV http_proxy=${PROXY_URL} https_proxy=${PROXY_URL}

#いちいち/bin/bashを入れなくても済むようにする
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

#鍵認証がない検証環境と接続するためのパッケージ：sshpass
#ビルド用java：openjdk-8-jdk

RUN apt update && apt install -y \
    openjdk-8-jdk \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*
    