# Open Source Outbreak Server

Hi all

To briefly state the goal behind this project, it's simply to preserve [dev ghostline](https://gitlab.com/users/gh0stl1ne/projects)'s Bioserver1 & 2 projects, as neither of these are available on github and both require a bit of work to get up and running.

## Setup
**DO IT BEFORE RUNNING GAME SERVER**
1. `cp .env.example .env`
2. set your server IP in .env (SERVER_IP=)
3. set your router IP or secondary dns (ROUTER_IP=)
4. build compose files 
    `docker compose -f docker-compose.infra.yaml build`
    `docker compose -f docker-compose.bio1.yaml build`
    `docker compose -f docker-compose.bio2.yaml build`
5. disable systemd-resovled `make disable-systemd-resolved`

### Running game server
1. run infrastracture `docker compose -f docker-compose.infra.yaml up -d`
2. run game server\
Just run `docker compose -f docker-compose.bio1.yaml up -d` for outbreak 1 and `docker compose -f docker-compose.bio2.yaml up -d` for outbreak 2\
**You can run them both!**\
`docker compose -f docker-compose.bio1.yaml -f docker-compose.bio2.yaml up -d`

### After shutdown
**DO NOT FORGET TO ENABLE systemd-resolved**\
Simply run `make enable-systemd-resolved`