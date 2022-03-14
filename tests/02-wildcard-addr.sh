#!/bin/sh

set -e
set -u

# Current directory
CWD="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"
# shellcheck disable=SC1090
. "${CWD}/.lib.sh"

IMAGE="${1}"
#NAME="${2}"
#VERSION="${3}"
TAG="${4}"
ARCH="${5}"
DEBUG="${6}"

NAME="bind$( shuf -i 1000000000-2000000000 -n 1 )"
PORT="5300"
WAIT=10


# DEBUG_ENTRYPOINT=2
run "docker run -d --rm --platform ${ARCH} --name ${NAME} -e DEBUG=${DEBUG} -e DEBUG_ENTRYPOINT=2 -e 'WILDCARD_DNS=devilbox=1.1.1.1' -p ${PORT}:53/udp ${IMAGE}:${TAG}"
run "sleep ${WAIT}"
sanity_check "${NAME}"
if ! run "dig @127.0.0.1 -p ${PORT} +short t1.devilbox | grep -E '^1\.1\.1\.1$'"; then
	if ! run "dig @127.0.0.1 -p ${PORT} +short t1.devilbox | grep -E '^1\.1\.1\.1$'"; then
		if ! run "dig @127.0.0.1 -p ${PORT} +short t1.devilbox | grep -E '^1\.1\.1\.1$'"; then
			echo "FAILED: t1.devilbox is not resolvable to 1.1.1.1"
			run "dig @127.0.0.1 -p ${PORT} +short t1.devilbox"
			run "docker logs ${NAME}"
			run "docker stop ${NAME}"
			echo "ABORT..."
			exit 1
		fi
	fi
fi
docker_stop "${NAME}"


# DEBUG_ENTRYPOINT=1
run "docker run -d --rm --platform ${ARCH} --name ${NAME} -e DEBUG=${DEBUG} -e DEBUG_ENTRYPOINT=1 -e 'WILDCARD_DNS=devilbox=1.1.1.1' -p ${PORT}:53/udp ${IMAGE}:${TAG}"
run "sleep ${WAIT}"
sanity_check "${NAME}"
if ! run "dig @127.0.0.1 -p ${PORT} +short t1.devilbox | grep -E '^1\.1\.1\.1$'"; then
	if ! run "dig @127.0.0.1 -p ${PORT} +short t1.devilbox | grep -E '^1\.1\.1\.1$'"; then
		if ! run "dig @127.0.0.1 -p ${PORT} +short t1.devilbox | grep -E '^1\.1\.1\.1$'"; then
			echo "FAILED: t1.devilbox is not resolvable to 1.1.1.1"
			run "dig @127.0.0.1 -p ${PORT} +short t1.devilbox"
			run "docker logs ${NAME}"
			run "docker stop ${NAME}"
			echo "ABORT..."
			exit 1
		fi
	fi
fi
docker_stop "${NAME}"


# DEBUG_ENTRYPOINT=0
run "docker run -d --rm --platform ${ARCH} --name ${NAME} -e DEBUG=${DEBUG} -e DEBUG_ENTRYPOINT=0 -e 'WILDCARD_DNS=devilbox=1.1.1.1' -p ${PORT}:53/udp ${IMAGE}:${TAG}"
run "sleep ${WAIT}"
sanity_check "${NAME}"
if ! run "dig @127.0.0.1 -p ${PORT} +short t1.devilbox | grep -E '^1\.1\.1\.1$'"; then
	if ! run "dig @127.0.0.1 -p ${PORT} +short t1.devilbox | grep -E '^1\.1\.1\.1$'"; then
		if ! run "dig @127.0.0.1 -p ${PORT} +short t1.devilbox | grep -E '^1\.1\.1\.1$'"; then
			echo "FAILED: t1.devilbox is not resolvable to 1.1.1.1"
			run "dig @127.0.0.1 -p ${PORT} +short t1.devilbox"
			run "docker logs ${NAME}"
			run "docker stop ${NAME}"
			echo "ABORT..."
			exit 1
		fi
	fi
fi
docker_stop "${NAME}"


# DEBUG_ENTRYPOINT=null
run "docker run -d --rm --platform ${ARCH} --name ${NAME} -e DEBUG=${DEBUG} -e 'WILDCARD_DNS=devilbox=1.1.1.1' -p ${PORT}:53/udp ${IMAGE}:${TAG}"
run "sleep ${WAIT}"
sanity_check "${NAME}"
if ! run "dig @127.0.0.1 -p ${PORT} +short t1.devilbox | grep -E '^1\.1\.1\.1$'"; then
	if ! run "dig @127.0.0.1 -p ${PORT} +short t1.devilbox | grep -E '^1\.1\.1\.1$'"; then
		if ! run "dig @127.0.0.1 -p ${PORT} +short t1.devilbox | grep -E '^1\.1\.1\.1$'"; then
			echo "FAILED: t1.devilbox is not resolvable to 1.1.1.1"
			run "dig @127.0.0.1 -p ${PORT} +short t1.devilbox"
			run "docker logs ${NAME}"
			run "docker stop ${NAME}"
			echo "ABORT..."
			exit 1
		fi
	fi
fi
docker_stop "${NAME}"
