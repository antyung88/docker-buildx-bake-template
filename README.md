# docker-buildx-bake-template [![Test Image](https://github.com/antyung88/docker-buildx-bake-template/actions/workflows/master.yml/badge.svg)](https://github.com/antyung88/docker-buildx-bake-template/actions/workflows/master.yml)
Docker Buildx Bake Template With Contexts 

# Prerequisites

- Ubuntu 20.04+ (Recommended)
- Docker & Docker-compose installed
- Have buildx plugin installed
```
LATEST=$(wget -qO- "https://api.github.com/repos/docker/buildx/releases/latest" | jq -r .name)
wget https://github.com/docker/buildx/releases/download/$LATEST/buildx-$LATEST.linux-amd64
chmod a+x buildx-$LATEST.linux-amd64
mkdir -p ~/.docker/cli-plugins
mv buildx-$LATEST.linux-amd64 ~/.docker/cli-plugins/docker-buildx
```

# Usage

Edit docker-bake.hcl 
```
# Defines Group
group "main" {
  targets = [
    "1",
    "2",
    "3"
    ]
}

# Defines Dockerfile Target 
target "1" {
  dockerfile = "./1.Dockerfile"
  tags = ["local1:latest"]
}

target "2" {
  dockerfile = "./2.Dockerfile"
  tags = ["local2:latest"]
}

# Contexts -- depends_on
target "3" {
  dockerfile = "./3.Dockerfile"
  contexts = {
    local1 = "target:1"
    local2 = "target:2"
  }
}
```
