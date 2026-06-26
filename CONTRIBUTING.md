# Contributing

Thanks for helping improve Tunely Home Assistant Add-ons. Small, focused pull
requests with clear validation are the easiest to review.

## Project Shape

This repository contains Home Assistant add-on packaging only. The Tunely Agent
source code lives in [tunely-eu/agent](https://github.com/tunely-eu/agent).

The add-on image copies the already released agent binary and packaged Caddyfile
from `ghcr.io/tunely-eu/agent`. Do not add a Go build step to this repository.

## Checks

Before opening a pull request, run:

```bash
bash -n tunely-agent/run.sh
docker build \
  --build-arg AGENT_IMAGE=ghcr.io/tunely-eu/agent:latest \
  --build-arg BUILD_VERSION=ci \
  --build-arg BUILD_ARCH=amd64 \
  -t tunely-agent-home-assistant:ci \
  tunely-agent
```

If the image build succeeds, verify the agent binary is present:

```bash
docker run --rm --entrypoint /usr/bin/tunely-agent \
  tunely-agent-home-assistant:ci list-modules
```

## Pull Requests

- Keep changes scoped to add-on packaging, documentation, or release automation.
- Update `README.md`, `tunely-agent/DOCS.md`, or translations when user-facing
  options change.
- Keep `tunely-agent/config.yaml` version aligned with the image tag you intend
  to release.
- Do not commit credentials, Home Assistant backups, local add-on data, logs, or
  generated binaries.

## Security

Do not open public issues for suspected vulnerabilities. Follow
[SECURITY.md](SECURITY.md).
