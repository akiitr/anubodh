#!/bin/bash

# Explanation of the command:
# 1. 'docker build -t anubodh_preview .'
#    - Builds the image and tags it as 'anubodh_preview'.
#    - Reusing the tag ensures we don't create infinite anonymous images.
#    - The previous image with this tag becomes "dangling" (untagged).
#
# 2. '&&' ensures the container runs only if the build succeeds.
#
# 3. 'docker run --rm -it ... anubodh_preview'
#    - Runs the container using the fixed tag.
#    - '--rm': Automatically deletes the container when it stops.
#    - '-v ...': Mounts the local content directory for live updates.
#
# 4. '; docker image prune -f'
#    - Runs after the container exits (even if it crashes).
#    - Deletes the "dangling" image created in step 1 (the old version of the code).
#    - Keeps the disk clean automatically.

docker build -t anubodh_preview . && \
docker run --rm -itp 7892:8080 -p 3002:3001 -v ./content:/usr/src/app/content anubodh_preview; \
docker image prune -f