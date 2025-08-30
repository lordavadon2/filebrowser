#!/bin/bash

# Script to build multi-arch Docker images for FileBrowser

set -e

IMAGE_NAME="user/filebrowser"
TAG="latest"

# Supported platforms
PLATFORMS="linux/amd64,linux/arm64,linux/arm/v7"

echo "Building multi-arch Docker image: $IMAGE_NAME:$TAG"
echo "Platforms: $PLATFORMS"

# Build and push multi-arch image
docker buildx build \
  --file Dockerfile.multiarch \
  --platform $PLATFORMS \
  --tag $IMAGE_NAME:$TAG \
  --push \
  --no-cache \
  .

echo "Multi-arch image built and pushed successfully!"
echo "You can inspect the image with: docker buildx imagetools inspect $IMAGE_NAME:$TAG"