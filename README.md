# kaniko-actions-pod

`kaniko-actions-pod` allows you to build container images via Github Actions on self-hosted non-docker kubernetes cluster. It's an Ubuntu container with Github Actions runner installed mixed with Kaniko container.

## How do I run it?
1. Get runner registration token (You can find it by going to "New runner" in your organisation's runners settings).
2. Run it on locally with podman / docker or deploy it on Kubernetes.
4. Add proper action definition to your 

### Run with docker

```
docker run -e URL=https://github.com/mysterycamp -e ACTIONS_TOKEN=ADCDNRZB7J4KECYVCD4AXTDBVO7WI -e PRIVATE_REGISTRY=registry.private.io -e PRIVATE_REGISTRY_USER=user -e PRIVATE_REGISTRY_TOKEN=FYXEi8PgjNaXv -e LABELS=testing-runner bb6d84951f7c
```

### Run on K8S
WIP
