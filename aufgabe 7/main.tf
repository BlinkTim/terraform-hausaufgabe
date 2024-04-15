
provider "http" {}
provider "local" {}

data "http" "chuck_norris_joke" {
  url = "https://api.chucknorris.io/jokes/random"
}

resource "local_file" "api_response" {
  filename = "${path.module}/api_response.json"
  content  = data.http.chuck_norris_joke.body
}

output "joke" {
  value = jsondecode(data.http.chuck_norris_joke.body).value
}
