#!/usr/bin/env bash
export PRE_RELEASE="$INPUT_PRE_RELEASE"

if [ -n "${INPUT_DOCKER_IMAGE}" ]; then
  exec /app/calc-version tags -s "${INPUT_DOCKER_REGISTRY}" -u "${INPUT_DOCKER_USERNAME}" -p "${INPUT_DOCKER_PASSWORD}" "${INPUT_DOCKER_IMAGE}"
fi

if [ -n "${INPUT_NEXT}"]; then
  exec /app/calc-version --next "${INPUT_NEXT}"
fi

exec /app/calc-version
