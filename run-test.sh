#!/bin/bash

# Start a container from the built image
docker run --name website-container -d website-image

# Wait for the container to start
sleep 5

# Check if the website can be opened
response=$(curl -sL -w "%{http_code}\\n" "http://localhost:80" -o /dev/null)

# Stop and remove the container
docker stop website-container
docker rm website-container

# Exit with an error code if the website cannot be opened
if [ "$response" != "200" ]; then
    echo "Website is not accessible, response code: $response"
    exit 1
fi

# Exit with a success code if the website can be opened
echo "Website is accessible, response code: $response"
exit 0
