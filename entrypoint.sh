#/bin/bash

if [[ -z "${REPO_URL}" ]]; then
	echo "REPO_URL not set."
	exit 1
fi

if [[ -z "${ACTIONS_TOKEN}" ]]; then
	echo "ACTIONS_TOKEN not set."
	exit 1
fi

if [[ -z "${NAME}" ]]; then
	NAME=kaniko-actions-pod-$(date +%s%N | md5sum | cut -c1-6)
	echo "NAME not set, generated one: $NAME"
fi

if [[ -z "${RUNNER_GROUP}" ]]; then
	RUNNER_GROUP=default
	echo "RUNNER_GROUP not set, using default: default"
fi

if [[ -z "${LABELS}" ]]; then
	LABELS=self-hosted-kaniko,self-hosted-alpine
	echo "LABELS not set, using default: self-hosted-kaniko,self-hosted-alpine"
fi


./config.sh --url ${REPO_URL} --token ${ACTIONS_TOKEN} --runnergroup ${RUNNER_GROUP} --labels ${LABELS} --name ${NAME} --work /actions-runner/work
./run.sh
