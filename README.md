# Homebrew Tap for HybriSight

```bash
brew tap AGAPII-ORG/hybrisight
brew install hybrisight
```

This tap provides the HybriSight CLI for macOS users.

---

# HybriSight CLI

**Read-only cloud and infrastructure efficiency snapshot engine.**

`pip install hybrisight` — scan AWS and Azure environments for security,
cost, and operational risks. Non-intrusive, no agents, no write access.

[![PyPI version](https://img.shields.io/pypi/v/hybrisight.svg)](https://pypi.org/project/hybrisight/)
[![Python 3.11+](https://img.shields.io/badge/python-3.11%2B-blue.svg)](https://www.python.org/)

## Quick Start

```bash
pip install hybrisight
hybrisight --help
```

## Commands

### `hybrisight scan`

Run a read-only cloud assessment. Supports AWS and Azure.

```bash
# AWS — interactive demo (no credentials needed)
hybrisight scan aws --demo

# AWS — live scan with your credentials
hybrisight scan aws

# AWS — specific regions
hybrisight scan aws --regions us-east-1,eu-west-1

# Azure — live scan (requires az login first)
hybrisight scan azure
```

Scans produce a `hybrisight-findings.json` file containing structured findings
for every resource analysed.

### `hybrisight report`

Generate human-readable reports from scan findings.

```bash
# HTML report (default)
hybrisight report --input hybrisight-findings.json --format html

# JSON summary
hybrisight report --input hybrisight-findings.json --format json

# PDF report
hybrisight report --input hybrisight-findings.json --format pdf
```

### `hybrisight doctor`

Check your local environment is ready for scans.

```bash
hybrisight doctor
```

### `hybrisight upload`

Upload findings to a HybriSight web dashboard.

```bash
hybrisight upload --findings hybrisight-findings.json --api-key YOUR_KEY
```

### `hybrisight merge`

Combine multiple scan results into a single consolidated findings file.

```bash
hybrisight merge findings-1.json findings-2.json --output merged.json
```

### `hybrisight auth`

Authenticate with a HybriSight deployment to obtain an API key.

```bash
hybrisight auth login
```

### `hybrisight signing`

Cryptographically sign scan artifacts for audit trail integrity.

```bash
hybrisight signing init          # Generate a signing key pair
hybrisight signing register       # Register your public key
hybrisight signing sign-artifact  # Sign a findings file
```

### `hybrisight version`

Print the installed CLI version.

```bash
hybrisight version
```

## Access Setup

- **AWS**: [Read-Only Access Guide](https://hybrisight.agapii.org/docs/access-setup/aws-readonly-access)
- **Azure**: [Azure Access Guide](https://hybrisight.agapii.org/docs/access-setup/azure-readonly-access)

## Other Install Methods

### Docker

```bash
docker pull agapii/hybrisight:latest
docker run --rm agapii/hybrisight:latest hybrisight scan aws --demo
```

### Install Script (macOS/Linux)

```bash
curl -fsSL https://hybrisight.agapii.org/install.sh | bash
```

### Install Script (Windows)

```powershell
irm https://hybrisight.agapii.org/install.ps1 | iex
```

## Documentation

Full documentation: [https://hybrisight.agapii.org/docs](https://hybrisight.agapii.org/docs)

## License

Apache 2.0

---

## Updating the Formula (maintainers)

When releasing a new version:

1. Get the SHA256 of the new source distribution:
```bash
curl -s https://pypi.org/pypi/hybrisight/NEW_VERSION/json | python3 -c 'import sys,json; d=json.load(sys.stdin); [print(u["digests"]["sha256"]) for u in d["urls"] if u["packagetype"]=="sdist"]'
```

2. Update `Formula/hybrisight.rb`:
   - Change `url` to the new version
   - Update `sha256`

3. Commit and push:
```bash
git add Formula/hybrisight.rb
git commit -m "hybrisight: update to vNEW_VERSION"
git push
```
