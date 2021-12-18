#===============================================================================
# Base image
#===============================================================================

FROM debian:latest

#===============================================================================
# Update package repositories and install new packages
#===============================================================================

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive \
  apt-get install \
  --assume-yes \
  --no-install-recommends \
  --quiet \
  ca-certificates \
  bash \
  binutils \
  desktop-file-utils \
  file \
  imagemagick \
  libglib2.0-dev \
  unzip \
  wget \
  && rm -rf /var/lib/apt/lists/*

#===============================================================================
# Change to the working directory
#===============================================================================

WORKDIR "/opt/work"

#===============================================================================
# Download pkg2appimage executable
#===============================================================================

RUN wget -c "https://github.com/AppImage/pkg2appimage/raw/master/pkg2appimage"

#===============================================================================
# Runtime entrypoint
#===============================================================================

ENTRYPOINT ["/bin/bash", "--login"]
