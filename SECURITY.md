# Security Policy

Security fixes are accepted on the `main` branch.

## Reporting Vulnerabilities

Please do not disclose suspected vulnerabilities in public issues, pull requests,
or discussions.

Use GitHub private vulnerability reporting for this repository. Open a private
vulnerability report from the repository's **Security** tab and include enough
detail for maintainers to reproduce and assess the issue.

Useful reports include:

- Affected version or commit
- Home Assistant installation type and architecture
- Add-on configuration, with tokens and hostnames redacted
- Steps to reproduce
- Expected and observed behavior
- Security impact
- Suggested fix, if known

## Scope

Security-sensitive areas include add-on option handling, token redaction, network
reachability expectations, image provenance, update behavior, and any behavior
that could expose an unintended local service.
