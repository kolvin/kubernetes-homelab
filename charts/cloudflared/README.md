<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Contents

- [cloudflared](#cloudflared)
  - [Prerequisites](#prerequisites)
  - [Todo](#todo)
  - [Resources](#resources)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# cloudflared

> This helm chart is used to deploy [cloudflared](https://github.com/cloudflare/cloudflared) to my homelab k3s cluster

---

## Prerequisites

By default, the credentials file will be created under ~/.cloudflared/<tunnel ID>.json
when you run `cloudflared tunnel create`. You can move it into a secret by using:
```sh
kubectl create secret generic tunnel-credentials \
--from-file=credentials.json=/Users/<uname>/.cloudflared/<tunnel ID>.json
```

Supply the secret via `values.config.existingSecret`

---

## Todo
- [ ] Refine docs

---

## Resources
- https://developers.cloudflare.com/cloudflare-one/tutorials/many-cfd-one-tunnel/
