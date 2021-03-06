provider "dcos" {}

resource "dcos_services_single_container" "test" {
  name      = "test/test1"
  cmd       = "while true; do echo foo;sleep 30;done"
  cpus      = 0.1
  mem       = 128
  instances = 1
}

data "dcos_service" "testdata" {
  name = "${dcos_services_single_container.test.name}"
}

output "testappcmd" {
  value = "${data.dcos_service.testdata.cmd}"
}
