# kaniko-actions-pod

`kaniko-actions-pod` is a base image for Github Actions Runner that allows you to build container images using Kaniko. Created to be run on self-hosted non-docker kubernetes cluster. It's a mixture of Kaniko container & Ubuntu container with Github Actions runner installed.

## Configuration
Following ENV vars can be set:
| Variable                 | Description                                                                | Required | Default value        |
|--------------------------|----------------------------------------------------------------------------|----------|----------------------|
| `URL`                    | Your organisation URL (e.g. `https://github.com/mysterycamp`)              | `true`   | -                    |
| `ACTIONS_TOKEN`          | Runner registration token (Can be found in organisation's runners options) | `true`   | -                    |
| `RUNNER_GROUP`           | Your runner group                                                          | `false`  | `default`            |
| `LABELS`                 | Runner labels (comma-separated)                                            | `false`  | `self-hosted-kaniko` |
| `PRIVATE_REGISTRY`       | Private registry that you want to push to                                  | `false`  | -                    |
| `PRIVATE_REGISTRY_USER`  | Private registry username                                                  | `false`  | -                    |
| `PRIVATE_REGISTRY_TOKEN` | Private registry token                                                     | `false`  | -                    |

## Start runner

### Run with docker

```
docker run -e URL=https://github.com/mysterycamp \
  -e ACTIONS_TOKEN=ADCDNRZB7J4KECYVCD4AXTDBVO7WIe \
  -e PRIVATE_REGISTRY=registry.private.io \
  -e PRIVATE_REGISTRY_USER=user \
  -e PRIVATE_REGISTRY_TOKEN=FYXEi8PgjNaXv \
  -e LABELS=testing-runner harbor.lakis.eu/mysterycamp/kaniko-actions-pod:0.0.2
```

### Run on K8S
See `deployment`

## Configure worklow
See `.github/workflows`. This image can't be built from itself though, as it uses `/kaniko` directory.
