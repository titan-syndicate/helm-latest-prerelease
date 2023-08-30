# latest-prerelease
Helm plugin for installing and upgrading to the latest pre-release version of a chart

[Launch in Docker dev environment](https://open.docker.com/dashboard/dev-envs?url=https://github.com/titan-syndicate/helm-latest-prerelease)


## Installation

```bash
helm plugin install https://github.com/titan-syndicate/helm-latest-prerelease
```

## Example Usage

```
helm install jenkins jenkins/jenkins --version=$(helm latest-prerelease)

```