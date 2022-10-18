terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.13.0"
    }
  }
}

provider "docker" {
  host    = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "data-node" {
  name = "data-node"
  build {
    path = "../node"
    tag  = ["data-node:1.0"]
    label = {
      author : "kai.zhao"
    }
  }
}

