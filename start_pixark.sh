#!/bin/bash

# Set up Wine environment if not already set up
if [ ! -d "$HOME/.wine" ]; then
    wineboot --init
fi

# Log in to Steam anonymously and download the PixARK dedicated server app
/opt/steamcmd/steamcmd.sh +force_install_dir ./pixark +login anonymous +app_update 824360 validate +quit

CMD_START="wine64 /pixark/ShooterGame/Binaries/Win64/PixARKServer.exe ${WORLD_TYPE}"

# Append the settings based on ? parameters
[ ! -z "$DELAY_REG_SERVER" ] && CMD_START="${CMD_START}?DelayRegisterServer=${DELAY_REG_SERVER}"
[ ! -z "$RAW_SOCKETS" ] && CMD_START="${CMD_START}?bRawSockets=${BRAW_SOCKETS}"
[ ! -z "$SESSION_NAME" ] && CMD_START="${CMD_START}?SessionName=${SESSION_NAME}"
[ ! -z "$ALT_SAVE_DIR" ] && CMD_START="${CMD_START}?AltSaveDirectoryName=${ALT_SAVE_DIR}"
[ ! -z "$SERVER_PASSWORD" ] && CMD_START="${CMD_START}?ServerPassword=${SERVER_PASSWORD}"
[ ! -z "$SERVER_ADMIN_PASSWORD" ] && CMD_START="${CMD_START}?ServerAdminPassword=${SERVER_ADMIN_PASSWORD}"
[ ! -z "$MAX_PLAYERS" ] && CMD_START="${CMD_START}?MaxPlayers=${MAX_PLAYERS}"
[ ! -z "$RCON_ENABLED" ] && CMD_START="${CMD_START}?RCONEnabled=${RCON_ENABLED}"
[ ! -z "$RCON_PORT" ] && CMD_START="${CMD_START}?RCONPort=${RCON_PORT}"

# Append the settings based on - parameters
[ ! -z "$SEED" ] && CMD_START="${CMD_START} -Seed=${SEED}"
[ "$USE_ALT_DIR" == "True" ] && CMD_START="${CMD_START} -ConfigsUseAltDir"
[ "$GAMEPLAY_LOGGING" == "True" ] && CMD_START="${CMD_START} -gameplaylogging"
[ "$LOG" == "True" ] && CMD_START="${CMD_START} -log"
[ ! -z "$CULTURE_FOR_COOKING" ] && CMD_START="${CMD_START} -CULTUREFORCOOKING=${CULTURE_FOR_COOKING}"
[ ! -z "$PORT" ] && CMD_START="${CMD_START} -Port=${PORT}"
[ ! -z "$CUBE_WORLD" ] && CMD_START="${CMD_START} -cubeworld=${CUBE_WORLD}"
[ ! -z "$QUERY_PORT" ] && CMD_START="${CMD_START} -QueryPort=${QUERY_PORT}"
[ ! -z "$CUBE_PORT" ] && CMD_START="${CMD_START} -CubePort=${CUBE_PORT}"
[ "$NO_BATTLEYE" == "True" ] && CMD_START="${CMD_START} -NoBattlEye"

# Execute the command
exec $CMD_START
