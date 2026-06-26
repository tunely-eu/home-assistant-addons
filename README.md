# Tunely Home Assistant Add-ons

[![CI](https://github.com/tunely-eu/home-assistant-addons/actions/workflows/ci.yml/badge.svg)](https://github.com/tunely-eu/home-assistant-addons/actions/workflows/ci.yml)
[![Release](https://github.com/tunely-eu/home-assistant-addons/actions/workflows/release.yml/badge.svg)](https://github.com/tunely-eu/home-assistant-addons/actions/workflows/release.yml)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

This repository lets you install Tunely Agent as a Home Assistant add-on.

With Tunely Agent, you can make selected services from your home or small office
available through secure Tunely HTTPS addresses without opening router ports.
The agent runs inside Home Assistant, connects outbound to Tunely, and applies
the services you configure in the Tunely dashboard.

## What You Can Use It For

Use this add-on when you want to reach self-hosted services from outside your
network, for example:

- Home Assistant
- media servers such as Jellyfin
- local dashboards and admin tools
- NAS or homelab web interfaces
- development or test services

You decide which services are published in the Tunely dashboard. Installing the
add-on does not automatically publish every device or service on your network.

## Available Add-ons

| Add-on | Description |
| --- | --- |
| [Tunely Agent](tunely-agent/README.md) | Runs Tunely Agent inside Home Assistant. |

## Requirements

You need:

- Home Assistant OS or another Supervisor-based Home Assistant installation
- a Tunely account
- a Tunely Agent token from the Tunely dashboard

Home Assistant Container does not support Home Assistant add-ons. If you use
Home Assistant Container, run Tunely Agent outside Home Assistant instead.

## Installation

Add this repository to Home Assistant:

```text
https://github.com/tunely-eu/home-assistant-addons
```

In Home Assistant:

1. Go to **Settings** -> **Add-ons** -> **Add-on Store**.
2. Open the repository menu.
3. Add the repository URL above.
4. Install **Tunely Agent**.
5. Open the add-on configuration and paste your Tunely Agent token.
6. Start the add-on.

## Configuration

The add-on has one required configuration option:

| Option | Required | Description |
| --- | --- | --- |
| `token` | yes | The Tunely Agent token from the Tunely dashboard. This token connects this Home Assistant add-on to your Tunely account. |

Keep this token private. Anyone with the token can connect an agent instance to
the Tunely configuration assigned to it.

## Publishing Services

After the add-on is running, choose the services you want to publish in the
Tunely dashboard. Each service needs an internal address that the add-on can
reach from inside Home Assistant.

Common examples:

```text
http://homeassistant:8123
http://192.168.1.50:8096
http://nas.local:5000
```

Use `http://homeassistant:8123` for Home Assistant itself. For services on other
devices, use their normal LAN address or hostname.

Do not use `localhost` or `127.0.0.1` for services running on the Home Assistant
host. From inside the add-on, those addresses point to the add-on container
itself, not to the host or another service. Use a LAN address, hostname, or a
reachable add-on/container network address instead.

## Backups and State

The add-on stores its runtime state and certificate material in the Home
Assistant add-on data volume under:

```text
/data/tunely-agent
```

Home Assistant hot backups include this data.

## Troubleshooting

If a service does not become reachable:

- check that the Tunely Agent add-on is running
- open the add-on **Log** tab in Home Assistant
- verify that the token was copied correctly
- verify that the internal service address is reachable from the add-on
- use `http://homeassistant:8123` for Home Assistant itself
- avoid `localhost` and `127.0.0.1` as service addresses

## Open Source

Tunely is built around open source networking components:

- [Bifrost](https://github.com/tunely-eu/bifrost), the tunnel runtime
- [caddy-bifrost](https://github.com/tunely-eu/caddy-bifrost), the Caddy-native
  integration for Bifrost

You do not need to install or configure these projects separately to use this
Home Assistant add-on.

## Security

Only publish services that you intentionally want to make available through your
Tunely HTTPS addresses. Keep your agent token private and remove or rotate it in
the Tunely dashboard if you believe it has been exposed.

Do not publish suspected vulnerabilities in public issues. Follow
[SECURITY.md](SECURITY.md).

## Support

For problems with this Home Assistant add-on, open an issue in this repository:

```text
https://github.com/tunely-eu/home-assistant-addons/issues
```

## License

MIT. See [LICENSE](LICENSE).
