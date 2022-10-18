#!/bin/sh
# shellcheck disable=SC2155

set -e
set -u

readonly curdir="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)"
readonly server_cn="${1:-rabbitmq}"
readonly certs_root_dir="$curdir/tls-gen/basic"

(cd "$certs_root_dir" && make "CN=$server_cn")

sed -e "s/SERVER_CN/$server_cn/g" "$curdir/rabbitmq.conf.in" > "$curdir/rabbitmq.conf"
