provider "local" {}

variable "create_file" {
  type    = bool
  default = true
}

resource "local_file" "conditional_file" {
  count    = var.create_file ? 1 : 0 
  filename = "${path.module}/conditional_file.txt"
  content  = "Diese Datei wird nur erstellt, wenn die Bedingung erfüllt ist."
}


output "file_path" {
  value     = var.create_file ? local_file.conditional_file[0].filename : "Datei nicht erstellt"
  sensitive = false
}
