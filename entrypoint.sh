#!/usr/bin/env bash

if [ -n "${DOCKER_IMAGE}" ]; then
  exec /app/calc-version tags -s "${DOCKER_REGISTRY}" -u "${DOCKER_USERNAME}" -p "${DOCKER_PASSWORD}" "${DOCKER_IMAGE}"
fi

if [ -n "${NEXT}"]; then
  exec /app/calc-version --next "${NEXT}"
fi

exec /app/calc-version
