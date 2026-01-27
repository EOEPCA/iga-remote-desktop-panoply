# iga-remote-desktop-panoply

Panoply 5.8 via Remote Desktop

## For maintainers

### Panoply version

To update the Panoply version set the URL (e.g. https://www.giss.nasa.gov/tools/panoply/download/PanoplyJ-5.8.0.zip) in the Dockerfile

See https://www.giss.nasa.gov/tools/panoply/download/ for the version number.

### Container versioning

Update the `release.yml` file to bump the container version 

## Container Image Strategy & Availability

This project publishes container images to GitHub Container Registry (GHCR) following a clear and deterministic tagging strategy aligned with the Git branching and release model.

### Image Registry

Images are published to:

```
ghcr.io/<repository-owner>/iat-jupyterlab
```

The registry owner corresponds to the GitHub repository owner (user or organization).

Images are built using Kaniko and pushed using OCI-compliant tooling.

### Tagging Strategy

The image tag is derived automatically from the Git reference that triggered the build:


| Git reference    | Image tag    | Purpose                            |
| ---------------- | ------------ | ---------------------------------- |
| `develop` branch | `latest-dev` | Development and integration builds |
| `main` branch    | `latest`     | Stable branch builds               |
| Git tag `vX.Y.Z` | `X.Y.Z`      | Immutable release builds           |

## Panoply versions vs container tags

| Image tag    | Panoply version |
| ------------ | --------------- |
|    1.0.0     |    5.8.1        |