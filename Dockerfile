FROM debian:bullseye-slim

WORKDIR /pixarkserver

# Update and install packages
RUN dpkg --add-architecture i386 && \
    apt-get update && apt-get install -y \
    wget \
    wine64 \
    wine32 \
    winetricks \
    lib32gcc1

# Download and install steamcmd
RUN wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz && \
    tar -xvzf steamcmd_linux.tar.gz

COPY ./ShooterGame /pixarkserver/ShooterGame

# Copy the startup script to the container
COPY start_pixark.sh /pixarkserver/start_pixark.sh
RUN chmod +x /pixarkserver/start_pixark.sh

# Set environment variables with default values
ENV WORLD_TYPE=CubeWorld_Light
ENV SEED=12345
ENV MAX_PLAYERS=20
ENV PORT=27015
ENV QUERY_PORT=27016
ENV RCON_PORT=27017
ENV CUBE_PORT=27018
ENV DELAY_REG_SERVER=True
ENV RAW_SOCKETS=True
ENV SESSION_NAME=MyPixarkServer
ENV CUBE_WORLD=MyPixarkServer
ENV SERVER_ADMIN_PASSWORD=letmein
ENV RCON_ENABLED=True
ENV CULTURE_FOR_COOKING=en
ENV LOG=True
ENV GAMEPLAY_LOGGING=True
ENV NO_BATTLEYE=True
ENV USE_ALT_DIR=False
# ENV ALT_SAVE_DIR=Trevoria
# ENV SERVER_PASSWORD=letmein

# Expose necessary ports
EXPOSE 27015 27016 27017 27018

# Use the startup script as the command
CMD ["/pixarkserver/start_pixark.sh"]
