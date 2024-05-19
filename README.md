# Open Source Outbreak Server

Hi all

To briefly state the goal behind this project, it's simply to preserve [dev ghostline](https://gitlab.com/users/gh0stl1ne/projects)'s Bioserver1 & 2 projects, as neither of these are available on github and both require a bit of work to get up and running.

## Running infrastructure
**DO IT BEFORE RUNNING GAME SERVER**
**Make sure to set up dnsmasq properly.**
[Just skip this tutorial to dnsmasq setup](https://gitlab.com/gh0stl1ne/Bioserver1/-/blob/master/Biohazard%20Outbreak%20private%20server.pdf?ref_type=heads)
1. `cp .env.example .env`
2. set your server IP in .env (SERVER_IP=)
3. start basic compose file `docker compose -f docker-compose.infra.yaml up --build -d`

### Running game server
Just run `docker compose -f docker-compose.bio1.yaml up --build` for outbreak 1 and `docker compose -f docker-compose.bio2.yaml up --build` for outbreak 2
**You can run them both!**
`docker compose -f docker-compose.bio1.yaml -f docker-compose.bio2.yaml up --build`