FROM gitlab/gitlab-ce:9.1.4-ce.0

RUN set -x && \
    apt-get update && \
    apt-get install patch wget && \
    apt-get clean

RUN set -x && \
    wget "https://raw.githubusercontent.com/ksoichiro/gitlab-i18n-patch/master/patches/v9.1.4/app_ja.patch" -O /tmp/app_ja.patch && \
    cd /opt/gitlab/embedded/service/gitlab-rails && \
    patch -p1 < /tmp/app_ja.patch && \
    rm /tmp/app_ja.patch


COPY user.rb.patch /tmp/
RUN set -x && \
    cd /opt/gitlab/embedded/service/gitlab-rails/app/models && \
    patch -p0 < /tmp/user.rb.patch && \
    rm /tmp/user.rb.patch

