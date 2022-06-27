# docker-buildx-bake-template
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
group "main" {
  targets = [
    "1",
    "2",
    "3"
    ]
}

target "1" {
  dockerfile = "./1.Dockerfile"
  tags = ["1local"]
}

target "2" {
  dockerfile = "./2.Dockerfile"
  tags = ["2local"]
}

target "3" {
  dockerfile = "./3.Dockerfile"
  contexts = {
    1local = "target:1"
    2local = "target:2"
  }
}
```
