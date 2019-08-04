#!/bin/bash

display_help() {
    echo "Usage: $0 [option...]" >&2
	echo "Usage: $0 [parm 1] [parm 2]" >&2
	echo "Example $0 parm1 parm2"
    echo "Tool Description"
    echo
    echo "   -h, --help              Show help"
    echo "   -r, --refresh           This will refresh the {docker-image} image"
    echo "                           (Only needed if {docker-image} updates)"
    echo
    # echo some stuff here for the -a or --add-options
    exit 1
}

removeImage() {
    docker image rm -f {docker-image}
}

function checkBase {
    if docker image ls | grep {docker-image}; then
        echo "Found {docker-image} docker image."
    else
        echo "Building {docker-image} image for first use. Please wait."
        docker build -t {docker-image}:latest -f ./docker/Dockerfile .
    fi
}


case "$1" in
  -h | --help)
      display_help
      exit 0
	  ;;
  -r | --refresh)
      removeImage
      checkBase
       ;;
  *)  # No more options
      checkBase
      echo "Running Tests"
      docker run --rm -it \
      -v "$1:{mount-directory}" \
      {docker-image} \
      {docker-cmd}
      ;;
esac