#/bin/bash

if [[ -z "$URL}" ]]; then
	echo "URL not set."
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

if [[ -z "${PRIVATE_REGISTRY}" ]]; then
	echo "Private registry not initialized"
else
	if [[ -z "${PRIVATE_REGISTRY_USER}" || -z "${PRIVATE_REGISTRY_TOKEN}" ]]; then
		echo "Private registry credentials not set"
	else
		REGISTRY_AUTH="$(echo -n $PRIVATE_REGISTRY_USER:$PRIVATE_REGISTRY_TOKEN | base64)"
		echo "{\"auths\":{\"registry.lakis.io\":{\"auth\":\"${REGISTRY_AUTH}\"}}}" > /kaniko/.docker/config.json
		echo "Private registry $PRIVATE_REGISTRY initialized"
	fi
fi


./config.sh --url ${URL} --token ${ACTIONS_TOKEN} --runnergroup ${RUNNER_GROUP} --labels ${LABELS} --name ${NAME} --work /actions-runner/work
./run.sh
