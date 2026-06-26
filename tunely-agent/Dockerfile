# syntax=docker/dockerfile:1.7

ARG AGENT_IMAGE=ghcr.io/tunely-eu/agent:latest
ARG BUILD_FROM=ghcr.io/home-assistant/base:latest

FROM ${AGENT_IMAGE} AS agent

FROM ${BUILD_FROM}

ARG BUILD_VERSION=dev
ARG BUILD_ARCH=amd64

LABEL \
    io.hass.version="${BUILD_VERSION}" \
    io.hass.type="app" \
    io.hass.arch="${BUILD_ARCH}" \
    org.opencontainers.image.source="https://github.com/tunely-eu/home-assistant-addons" \
    org.opencontainers.image.documentation="https://github.com/tunely-eu/home-assistant-addons/tree/main/tunely-agent" \
    org.opencontainers.image.title="Tunely Agent Home Assistant Add-on" \
    org.opencontainers.image.vendor="Tunely" \
    org.opencontainers.image.description="Home Assistant add-on wrapper for Tunely Agent"

COPY --from=agent /usr/bin/tunely-agent /usr/bin/tunely-agent
COPY --from=agent /etc/tunely-agent/Caddyfile /etc/tunely-agent/Caddyfile
COPY run.sh /run.sh

RUN chmod a+x /run.sh

CMD ["/run.sh"]
