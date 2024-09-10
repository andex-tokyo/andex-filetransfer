#!/bin/sh
# 環境変数を置換してテンプレートから設定ファイルを生成
envsubst < /app/config/cloudconfig.template.yml > /app/config/cloudconfig.yml
envsubst < /app/config/config.template.json > /app/config/config.json

# コンテナのメインプロセスを起動
if [ "$DOCKER_NONROOT" = "true" ]; then
	echo "Setting permissions" && \
	chown -R gokapi:gokapi /app && \
	chmod -R 700 /app && \
	echo "Starting application" && \
	exec su-exec gokapi:gokapi /app/gokapi "$@"
else
	exec /app/gokapi "$@"
fi
