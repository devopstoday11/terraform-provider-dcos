resource "dcos_job" "ajob" {
  name = "ajobid"
  cmd  = "echo foo"
  cpus = 1
  mem  = 32
  disk = 0
  description  = "the best description ever"

  docker {
    image = "ubuntu:latest"
  }

  artifacts {
    uri = "http://downloads.mesosphere.com/robots.txt"
    extract = false
    executable = true
    cache = false
  }

  volume {
    container_path = "/mnt/test"
    host_path = "/dev/zero"
    mode = "RW"
  }
}
