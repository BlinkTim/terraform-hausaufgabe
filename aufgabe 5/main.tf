provider "local" {}
provider "template" {}

data "template_file" "config" {
  template = <<EOF
{
  "user": "${user}",
  "password": "${password}"
}
EOF

  vars = {
    user     = "exampleUser"
    password = "examplePassword"
  }
}

resource "local_file" "config_file" {
  filename = "config.json"
  content  = data.template_file.config.rendered
}

output "file_path" {
  value = local_file.config_file.filename
}
