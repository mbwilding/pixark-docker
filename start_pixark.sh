#!/bin/bash

# Set up Wine environment if not already set up
if [ ! -d "$HOME/.wine" ]; then
    wineboot --init
fi

# Log in to Steam anonymously and download the PixARK dedicated server app
/opt/steamcmd/steamcmd.sh +force_install_dir /pixark +@sSteamCmdForcePlatformType windows +login anonymous +app_update 824360 validate +quit

CMD_START="wine64 /pixark/ShooterGame/Binaries/Win64/PixARKServer.exe ${WORLD_TYPE}"

# Append the settings based on ? parameters
[ -n "$DELAY_REG_SERVER" ] && CMD_START="${CMD_START}?DelayRegisterServer=${DELAY_REG_SERVER}"
[ -n "$RAW_SOCKETS" ] && CMD_START="${CMD_START}?bRawSockets=${RAW_SOCKETS}"
[ -n "$SERVER_NAME" ] && CMD_START="${CMD_START}?SessionName=${SERVER_NAME}" && CMD_START="${CMD_START} -cubeworld=${SERVER_NAME}"
[ -n "$ALT_SAVE_DIR" ] && CMD_START="${CMD_START}?AltSaveDirectoryName=${ALT_SAVE_DIR}"
[ -n "$SERVER_PASSWORD" ] && CMD_START="${CMD_START}?ServerPassword=${SERVER_PASSWORD}"
[ -n "$SERVER_ADMIN_PASSWORD" ] && CMD_START="${CMD_START}?ServerAdminPassword=${SERVER_ADMIN_PASSWORD}"
[ -n "$MAX_PLAYERS" ] && CMD_START="${CMD_START}?MaxPlayers=${MAX_PLAYERS}"
[ -n "$RCON_ENABLED" ] && CMD_START="${CMD_START}?RCONEnabled=${RCON_ENABLED}"
[ -n "$RCON_PORT" ] && CMD_START="${CMD_START}?RCONPort=${RCON_PORT}"

# Append the settings based on - parameters
[ -n "$SEED" ] && CMD_START="${CMD_START} -Seed=${SEED}"
[ "$USE_ALT_DIR" == "True" ] && CMD_START="${CMD_START} -ConfigsUseAltDir"
[ "$GAMEPLAY_LOGGING" == "True" ] && CMD_START="${CMD_START} -gameplaylogging"
[ "$LOG" == "True" ] && CMD_START="${CMD_START} -log"
[ -n "$CULTURE_FOR_COOKING" ] && CMD_START="${CMD_START} -CULTUREFORCOOKING=${CULTURE_FOR_COOKING}"
[ -n "$PORT" ] && CMD_START="${CMD_START} -Port=${PORT}"
[ -n "$QUERY_PORT" ] && CMD_START="${CMD_START} -QueryPort=${QUERY_PORT}"
[ -n "$CUBE_PORT" ] && CMD_START="${CMD_START} -CubePort=${CUBE_PORT}"
[ "$NO_BATTLEYE" == "True" ] && CMD_START="${CMD_START} -NoBattlEye"
[ -n "$ADDITIONAL_ARGS" ] && CMD_START="${CMD_START} ${ADDITIONAL_ARGS}"

# Execute the command
exec "$CMD_START"
