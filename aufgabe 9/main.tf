
provider "null" {}
provider "local" {}

resource "null_resource" "execute_script" {
  provisioner "local-exec" {
    command = "sh ${path.module}/script.sh"
  }
  
  triggers = {
    always_run = "${timestamp()}"
  }
}

output "script_execution" {
  value = "Das Shell-Skript wurde ausgeführt."
}
