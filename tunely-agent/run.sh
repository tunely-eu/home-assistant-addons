#!/usr/bin/with-contenv bashio
set -euo pipefail

AGENT_TOKEN="$(bashio::config 'token')"
if [ -z "$(printf '%s' "${AGENT_TOKEN}" | tr -d '[:space:]')" ]; then
  bashio::log.fatal "Set the Tunely Agent token in the add-on configuration."
fi

export TOKEN="${AGENT_TOKEN}"
export TUNELY_AGENT_STATE_DIR="/data/tunely-agent"
export TUNELY_INSTALL_CHANNEL="home_assistant"

bashio::log.info "Starting Tunely Agent"
exec /usr/bin/tunely-agent run --config /etc/tunely-agent/Caddyfile --adapter caddyfile
