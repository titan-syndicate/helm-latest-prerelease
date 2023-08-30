# latest-prerelease
Helm plugin for installing and upgrading to the latest pre-release version of a chart

[Launch in Docker dev environment](https://open.docker.com/dashboard/dev-envs?url=https://github.com/titan-syndicate/helm-latest-prerelease)

Supports alpha, beta, and rc prerelease labels with a single prerelease numeric identifier. Example of ordering:

`0.0.2 > 0.0.2-rc.1 > 0.0.2-beta.10 > 0.0.2-alpha.30`

## Installation

```bash
helm plugin install https://github.com/titan-syndicate/helm-latest-prerelease
```

## Example Usage

```
helm upgrade -i jenkins jenkins/jenkins --version=$(helm latest-prerelease jenkins/jenkins)
```
