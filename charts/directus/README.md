<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Contents

- [directus](#directus)
  - [Prerequisites](#prerequisites)
  - [Chart defaults](#chart-defaults)
  - [Installation](#installation)
  - [Configuration](#configuration)
  - [Todo](#todo)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# directus

> This Helm chart provides a simple way to self host/deploy the [Directus Headless CMS](https://docs.directus.io/getting-started/introduction.html) to Kubernetes. It is based on the official [Directus Docker image](https://hub.docker.com/r/directus/directus) and can be easily customized to suit your specific requirements.


> Disclaimer:
This project is for personal use only and is provided without any warranty or support. Use it at your own risk, and the creator of this project is not responsible for any damages or losses. The project may contain errors or bugs, and the user is solely responsible for any consequences that may arise from using it. By using this project, you agree to these terms.

## Prerequisites

Before you begin, ensure that you have the following:
- An understanding of [Directus Architecture](https://docs.directus.io/getting-started/architecture.html)
- An understanding of [Kubernetes Secrets](https://kubernetes.io/docs/concepts/configuration/secret/)
- A running Kubernetes cluster
- Helm installed

## Chart defaults

By default, this chart will deploy directus with [Redis](https://hub.docker.com/r/bitnami/redis/) + [PostgreSQL](https://hub.docker.com/r/bitnami/postgresql/) + [Github SSO](https://docs.directus.io/self-hosted/config-options.html)

> First time setup will require `config.auth.admin.enabled` so you can login with uname+password, then you can fetch your Admin Role ID that can be supplied into the SSO config via `config.auth.sso.github.default_role_id`. Lastly, ensure `config.auth.sso.github.allow_public_registrations` is enabled so new users can be created with SSO logins, i disabled this by default so not every [tom dick and harry](https://en.wikipedia.org/wiki/Tom,_Dick_and_Harry) can login

## Installation

To install the chart, run the following command:

```bash
helm repo add directus https://<todo>/charts/directus
helm install my-directus directus/directus
```

## Configuration

See `.Values.config` for currently supported directus application configuration.

## Todo
- [ ] Document all chart input values
- [ ] Document first time setup considerations
