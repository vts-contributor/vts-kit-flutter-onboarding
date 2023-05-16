#!/bin/bash
set -e

echo "Build docker"
echo "IMAGE NAME" ${harborProject}/${appName}:latest
newDockerfilePath=$(npx @vts-private/cli@latest template --templateUrl=cicd/configs/Dockerfile | tail -1)
docker build --rm=false -f "$newDockerfilePath" -t ${harborProject}/${appName}:latest .