provider "local" {}

resource "local_file" "hello_file" {
  filename = "hello.txt"
  content  = "Hello, Terraform!"
}

output "file_path" {
  value = local_file.hello_file.filename
}
