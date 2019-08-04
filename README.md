# Docker Wrapper
Boiler plate scripts to make it easier to run commands inside a docker container.

Scripts will build a docker image if it doesn't exist then executed the specified commands in a docker container.  The container instance will be deleted when command finishes.

## How to use
1. Update scripts replacing `{docker-image}` with your custom image name for example `newman`
2. Update the example usage and options commands with the appropriate parameters
3. Update Tool Description with your desired description
4. Update the `{mount-directory}` with the appropriate directory or add addtional mounts if required
5. Update the `{docker-cmd}` with the command you wish to run in the docker container
