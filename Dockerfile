FROM debian:bullseye-slim

WORKDIR /pixark

# Update and install packages
RUN add-apt-repository multiverse && \
    apt-get install software-properties-common -y && \
    dpkg --add-architecture i386 && \
    apt-get update && apt-get install -y \
    wget \
    wine64 \
    wine32 \
    lib32gcc-s1 \
    steamcmd

# Copy the startup script to the container
COPY start_pixark.sh /start_pixark.sh
RUN chmod +x /start_pixark.sh

# Set environment variables with default values
ENV WORLD_TYPE=CubeWorld_Light
ENV SEED=12345
ENV MAX_PLAYERS=20
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

# Static ports
ENV PORT=27015
ENV QUERY_PORT=27016
ENV RCON_PORT=27017
ENV CUBE_PORT=27018

# Expose necessary ports, match the ports above
EXPOSE 27015 27016 27017 27018

# Use the startup script as the command
CMD ["/start_pixark.sh"]
