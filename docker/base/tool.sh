#!/bin/bash
set -e

function show_usage() {
    echo ""
    echo "Usage: $(basename $0) COMMAND [TAG]"
    echo ""
    echo "   COMMAND: build or commit."
    echo "            commit needs prior login in docker hub"
    echo "   TAG: (optional) docker tag. default: latest"
    echo "            venkykrishna/dockerbase:TAG"
    echo ""
}

if (( $# < 1 )); then
    show_usage
    exit -1
fi

COMMAND=$( echo "$1" | tr '[:upper:]' '[:lower:]' )
TAG=$( echo "$2" | tr '[:upper:]' '[:lower:]' )

if [ -z $TAG ]; then
    TAG="latest"
fi

DOCKER_TAG="cpsc585/base:$TAG"
DOCKERFILE="Dockerfile"
DOCKER_BINARY="docker"

if [[ "${COMMAND}" == "build" ]]; then
    ${DOCKER_BINARY} build --no-cache --force-rm \
    -t ${DOCKER_TAG} -f ${DOCKERFILE} .
elif [[ "${COMMAND}" == "push" ]]; then
    ${DOCKER_BINARY} push ${DOCKER_TAG}
else
    echo "Unknown COMMAND=${COMMAND}"
    show_usage
    exit 1
fi
