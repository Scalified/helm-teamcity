# TeamCity Helm Chart

[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/Scalified/helm-teamcity/blob/master/LICENSE)
[![Release](https://img.shields.io/github/v/release/Scalified/helm-teamcity?style=flat-square)](https://github.com/Scalified/helm-teamcity/releases/latest)
[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/scalified-teamcity)](https://artifacthub.io/packages/helm/scalified-teamcity/teamcity)

## Requirements

* [Helm 3+](https://helm.sh)

## Installation

```bash
helm repo add scalified-teamcity https://scalified.github.io/helm-teamcity/
helm upgrade --install nexus scalified-teamcity/teamcity --create-namespace --namespace teamcity
```

---

**Made with ❤️ by [Scalified](http://www.scalified.com)**
