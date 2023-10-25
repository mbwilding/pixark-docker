FROM archlinux:latest

WORKDIR /pixark

# Copy the startup script to the container
COPY start_pixark.sh /start_pixark.sh

RUN chmod +x /start_pixark.sh && \
    echo -e "\n[multilib]\nInclude = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf && \
    pacman -Syu --noconfirm && \
    pacman -S wget wine lib32-libunwind --noconfirm && \
    \
    wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz && \
    tar -xvzf steamcmd_linux.tar.gz -C /opt/steamcmd && \
    rm steamcmd_linux.tar.gz && \
    chmod +x /opt/steamcmd/linux32/steamcmd

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
