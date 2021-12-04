# kaniko-actions-pod

`kaniko-actions-pod` is a base image for Github Actions Runner that allows you to build container images using Kaniko. Created to be run on self-hosted non-docker kubernetes cluster. It's a mixture of Kaniko container & Ubuntu container with Github Actions runner installed.

## How do I run it?
1. Get runner registration token (You can find it by going to "New runner" in your organisation's runners settings).
2. Run it on locally with podman / docker or deploy it on Kubernetes.
3. Add proper action definition to your Actions workflow.

### Run with docker

```
docker run -e URL=https://github.com/mysterycamp -e ACTIONS_TOKEN=ADCDNRZB7J4KECYVCD4AXTDBVO7WI -e PRIVATE_REGISTRY=registry.private.io -e PRIVATE_REGISTRY_USER=user -e PRIVATE_REGISTRY_TOKEN=FYXEi8PgjNaXv -e LABELS=testing-runner bb6d84951f7c
```

### Run on K8S
WIP
