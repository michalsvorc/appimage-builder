# AppImage builder

Docker environment for building AppImages with with [pkg2appimage](https://github.com/AppImage/pkg2appimage).

## Build

Clone this repository, cd to it and execute:

```console
$ docker build --tag appimage-builder:latest .
```

To update the `pkg2appimage`, rebuild the Docker image.

## Recipe names

You need to supply a pkg2appimage recipe name as an argument to the Docker run command.

Recipe name is a base file name without the `.yml` file extension.

See full list of [recipes](https://github.com/AppImage/pkg2appimage/tree/master/recipes).

Example recipe name: `VSCode`

## Run

Start an interactive session:

```console
$ docker run \
  -it \
  --name appimage-builder-latest \
  appimage-builder:latest
```

Execute in the container session:

```console
$ bash -ex pkg2appimage <recipe-name>
$ ls -l /opt/work/out
```

Solve any issues or missing dependencies.

Use Docker [cp command](https://docs.docker.com/engine/reference/commandline/cp/) to copy the AppImage from `/opt/work/out` directory.

## Issues

### fuse

Not present in user namespace isolated containers.

See this [stack overflow](https://stackoverflow.com/questions/48402218/fuse-inside-docker) thread when you encounter this issue.

## Tested recipes

- VSCode

## Notes

This project is not affiliated with nor endorsed by [pkg2appimage](https://github.com/AppImage/pkg2appimage).
