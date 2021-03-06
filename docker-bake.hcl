group "main" {
  targets = [
    "1",
    "2",
    "3"
    ]
}

target "1" {
  dockerfile = "./1.Dockerfile"
  tags = ["local1:latest"]
}

target "2" {
  dockerfile = "./2.Dockerfile"
  tags = ["local2:latest"]
}

target "3" {
  dockerfile = "./3.Dockerfile"
  contexts = {
    local1 = "target:1"
    local2 = "target:2"
  }
}
