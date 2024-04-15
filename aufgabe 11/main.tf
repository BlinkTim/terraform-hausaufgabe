provider "local" {}
provider "random" {}


resource "random_integer" "subnet_count" {
  min = 1
  max = 5
}

resource "random_string" "subnet" {
  count  = random_integer.subnet_count.result
  length = 10
  special = false
}

resource "local_file" "subnet_file" {
  filename = "${path.module}/subnets.txt"
  content  = join("\n", random_string.subnet.*.result)
}

output "subnet_ids" {
  value = random_string.subnet.*.result
}
