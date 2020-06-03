FROM debian:buster

# Install git, supervisor, VNC, & X11 packages
RUN set -ex; \
    apt-get update; \
    apt-get install -y \
    bash \
    fluxbox \
    git \
    net-tools \
    novnc \
    supervisor \
    x11vnc \
    xterm \
    xvfb \
    ca-certificates \
    curl \
    desktop-file-utils \
    libappindicator3-1 \
    libasound2 \
    libgbm1 \
    libgtk-3-0 \
    libnotify4 \
    libnss3 \
    libsecret-1-0 \
    libxss1 \
    libxtst6 \
    unzip \
    wget \
    xdg-utils \
    && rm -r /var/lib/apt/lists/* \
    && curl -L -O -s https://github.com/feelingsurf/viewer/releases/download/v1.3.1/FeelingSurfViewer-linux-amd64-1.3.1.deb \
    && dpkg -i FeelingSurfViewer-linux-amd64-1.3.1.deb \
    && rm FeelingSurfViewer-linux-amd64-1.3.1.deb



ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=768 \
    RUN_XTERM=yes \
    RUN_FLUXBOX=yes


COPY . /app
CMD ["/app/entrypoint.sh"]
EXPOSE 8080
