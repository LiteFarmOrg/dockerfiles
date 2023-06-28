#!/usr/bin/env bash

set -eux

CI_COMMIT="${CI_COMMIT:=HEAD}"
CHANGED_FILES=$(git show --oneline --name-only "${CI_COMMIT}")
NAMESPACE="litefarm"
PREFIX=$(date +%Y%m%d.%H%M%S)
TAG="${PREFIX}.${CI_COMMIT:0:7}"

while read -r change; do
	(
		echo "${change}"
		if [[ "${change}" =~ Dockerfile$ ]]; then
			image=$(awk -F '/' '{print $1}' <<<"${change}")
			cd "${image}"
			docker build -t "${NAMESPACE}/${image}:${TAG}" .
			docker push "${NAMESPACE}/${image}:${TAG}"
		fi
	)
done <<<"${CHANGED_FILES}"
