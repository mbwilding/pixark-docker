# PixARK Server

This Dockerfile is designed to set up a PixARK dedicated server in a Docker container.

## Setting Environment Variables

You can customize your PixARK server by setting the appropriate environment variables. Here are the variables available:

- **WORLD_TYPE**: Defines the world type (default: `CubeWorld_Light`).
- **SEED**: Seed for map generation (default: `12345`).
- **MAX_PLAYERS**: Max number of players (default: `20`).
- **DELAY_REG_SERVER**: Delay server registration (default: `True`).
- **RAW_SOCKETS**: Use raw sockets (default: `True`).
- **SESSION_NAME**: Session name (default: `MyPixarkServer`).
- **CUBE_WORLD**: Cube world name (default: `MyPixarkServer`).
- **SERVER_ADMIN_PASSWORD**: Admin password (default: `letmein`).
- **RCON_ENABLED**: Enable RCON (default: `True`).
- **CULTURE_FOR_COOKING**: Language culture for cooking (default: `en`).
- **LOG**: Enable logging (default: `True`).
- **GAMEPLAY_LOGGING**: Enable gameplay logging (default: `True`).
- **NO_BATTLEYE**: Disable BattleEye (default: `True`).
- **USE_ALT_DIR**: Use alternative directory (default: `False`).
- **ALT_SAVE_DIR**: (Optional) Alternative save directory.
- **SERVER_PASSWORD**: (Optional) Server password.
