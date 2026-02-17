#!/bin/bash

# --- Portainer Update Script ---

CONTAINER_NAME="portainer"
VOLUME_NAME="portainer_data"
IMAGE_NAME="portainer/portainer-ce:lts" # Use 'portainer/portainer-ee:lts' for Business Edition

echo "Stopping the current Portainer container..."
docker stop $CONTAINER_NAME

echo "Removing the old Portainer container..."
docker rm $CONTAINER_NAME

echo "Pulling the latest Portainer image ($IMAGE_NAME)..."
docker pull $IMAGE_NAME

echo "Redeploying the updated Portainer container..."
docker run -d -p 8000:8000 -p 9443:9443 --name=$CONTAINER_NAME --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v $VOLUME_NAME:/data $IMAGE_NAME

echo "Portainer update complete! It should be available at https://your-server-ip:9443"
