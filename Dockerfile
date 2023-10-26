FROM archlinux:latest

# Copy the startup script to the container
COPY start_pixark.sh /start_pixark.sh

RUN mkdir -p /pixark && \
    chmod +x /start_pixark.sh && \
    echo -e "\n[multilib]\nInclude = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf && \
    pacman -Syu --noconfirm && \
    pacman -S wget wine winetricks lib32-libunwind --noconfirm && \
    wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz && \
    mkdir -p /opt/steamcmd && \
    tar -xvzf steamcmd_linux.tar.gz -C /opt/steamcmd && \
    rm steamcmd_linux.tar.gz && \
    chmod +x /opt/steamcmd/linux32/steamcmd && \
    chmod +x /opt/steamcmd/steamcmd.sh

# Set environment variables with default values
ENV WORLD_TYPE=CubeWorld_Light
ENV SEED=12345
ENV MAX_PLAYERS=20
ENV DELAY_REG_SERVER=True
ENV RAW_SOCKETS=True
ENV SERVER_NAME=PixarkContainer
ENV SERVER_ADMIN_PASSWORD=letmein
ENV RCON_ENABLED=True
ENV CULTURE_FOR_COOKING=en
ENV LOG=True
ENV GAMEPLAY_LOGGING=True
ENV NO_BATTLEYE=True
ENV USE_ALT_DIR=False
# ENV ADDITIONAL_ARGS=
# ENV ALT_SAVE_DIR=Trevoria
# ENV SERVER_PASSWORD=letmein

# Ports
ENV PORT=27015
ENV QUERY_PORT=27016
ENV RCON_PORT=27017
ENV CUBE_PORT=27018

# Use the startup script as the command
CMD ["/start_pixark.sh"]
