FROM jarokelo/debian:jessie

RUN buildDeps='ruby-dev libssl-dev make gcc g++ libsqlite3-dev' && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    ruby \
    libsqlite3-0 \
    $buildDeps \
    && \
    gem install mailcatcher \
    && apt-get purge -y --auto-remove $buildDeps \
    && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 1025
EXPOSE 1080

ENTRYPOINT ["mailcatcher", "-f"]
