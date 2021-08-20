# sver-action

Semantic versioning action.

Can output:

- The current version of your repo, as calculated by [sver](https://github.com/aserto-dev/sver).
- The next patch/minor/major version
- The tags you should apply to your docker container image


## Example

```yaml
jobs:
  build:
    steps:
      - uses: actions/checkout@v2
      - name: Login to GitHub Packages Docker Registry
        uses: docker/login-action@v1
        with:
          registry: https://ghcr.io
          username: ${{ env.DOCKER_USERNAME }}
          password: ${{ env.DOCKER_PASSWORD }}
      - uses: aserto-dev/sver@v0.0.9
        name: Calculate Tags
        id: "sver"
        with:
          docker_image: ${{ env.DOCKER_IMAGE }}
          docker_registry: "https://ghcr.io"
          docker_registry_username: "env.DOCKER_USERNAME"
          docker_registry_password: "env.DOCKER_PASSWORD"
      - name: Push image to GitHub Container Registry
        run: |
          echo "${{ steps.sver.outputs.version }}" | \
            xargs -I{} bash -c "docker tag my-image ghcr.io:{}' \
            && docker push '${{ env.DOCKER_IMAGE }}:{}'
```

## Inputs

### `pre_release`

**Optional** If specified, this pre release reference will be added to the calculated semantic version.

### `docker_image`

**Optional** If specified, sver will calculate the tags for your docker image.

### `docker_registry`

**Optional** Registry for the docker image.

### `docker_username`

**Optional** Credentials for connecting to the docker registry.

### `docker_password`

**Optional** Credentials for connecting to the docker registry.

### `next`

**Optional** Tells sver to print the next version, not the current one. Can be one of `patch`, `minor` or `major`.

## Outputs

### `version`

The calculated version.
When using this to calculate tags, the output is a multiline string, with each tag on a separate line.


