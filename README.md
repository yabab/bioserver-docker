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

# STEPS TO RUN IN A PUBLIC DEBIAN LINUX INSTANCE

## SETUP

1.
```
sudo apt-get update
```

2.
```
sudo apt-get upgrade -y
```

3.
```
sudo apt-get install ca-certificates curl gnupg lsb-release make git-all -y
```

4.
```
sudo mkdir -p /etc/apt/keyrings
```

5.
```
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

6.
```
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

7.
```
sudo apt-get update
```

8.
```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
```

9.
```
git clone https://github.com/yabab/bioserver-docker.git
```

10.
```
cd bioserver-docker
```
If necessary, then checkout the correct branch; like 'git checkout publicInstance'

11.
```
cp .env.example .env
```

12.
```
nano .env (Add Public IPv4 address to SERVER_IP and ROUTER_IP)
```

13.
```
sudo docker compose -f docker-compose.infra.yaml -f docker-compose.bio1.yaml -f docker-compose.bio2.yaml build
```

14.
```
sudo docker pull mysql:5.7
```

## START UP

1.
```
make disable-systemd-resolved
```

2.
```
sudo docker compose -f docker-compose.infra.yaml up -d
```
If some process is bound to a necessary port, use 'sudo ss -tulpn | grep ":(port)"' to discover the offending processes and use 'sudo kill PID' to get rid of them.

3.
```
sudo docker compose -f docker-compose.bio1.yaml up -d
```

4.
```
sudo docker compose -f docker-compose.bio2.yaml up -d
```

## TEAR DOWN

1.
```
sudo docker compose -f docker-compose.bio2.yaml down -v
```

2.
```
sudo docker compose -f docker-compose.bio1.yaml down -v
```

3.
```
sudo docker compose -f docker-compose.infra.yaml down -v
```

4.
```
make enable-systemd-resolved
```

Don't forget to enable online traffic from all sources to the instance. In case of doubt, enable all traffic to all protocols. If you're doing this, please use an SSH key because the instance will be exposed.