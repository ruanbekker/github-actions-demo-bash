#!/usr/bin/env bash
JENKINS_JOB="github-actions-demo"
curl -XPOST "https://${JENKINS_USERNAME}:${JENKINS_USER_TOKEN}@${JENKINS_HOSTNAME}/job/${JENKINS_JOB}/build?token=${JENKINS_BUILD_TOKEN}"
