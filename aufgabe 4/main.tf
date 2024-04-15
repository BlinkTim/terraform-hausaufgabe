provider "tls" {}

resource "tls_private_key" "example_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "tls_self_signed_cert" "example_cert" {
  key_algorithm   = tls_private_key.example_key.algorithm
  private_key_pem = tls_private_key.example_key.private_key_pem

  subject {
    common_name  = "example.com"
  }

  validity_period_hours = 8760 
  is_ca_certificate      = true

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth"
  ]
}

output "private_key_pem" {
  value     = tls_private_key.example_key.private_key_pem
  sensitive = true  # Markiert den Output als sensibel
}

output "public_cert_pem" {
  value = tls_self_signed_cert.example_cert.cert_pem
}
