# kaniko-actions-pod

Build container images via Github Actions on self-hosted non-docker kubernetes cluster.

## How do I run it?
You need to have runner registration token. You can find it by going to "New runner" in your organisation's runners settings.

### Run with docker

```
docker run -e URL=https://github.com/mysterycamp -e ACTIONS_TOKEN=ADCDNRZB7J4KECYVCD4AXTDBVO7WI -e PRIVATE_REGISTRY=registry.private.io -e PRIVATE_REGISTRY_USER=user -e PRIVATE_REGISTRY_TOKEN=FYXEi8PgjNaXv -e LABELS=testing-runner bb6d84951f7c
```

### Run on K8S
WIP
