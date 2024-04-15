
# Konfiguriere die Provider
provider "random" {}
provider "local" {}

# Generiere einen zufälligen String
resource "random_string" "random" {
  length  = 10
  special = false
  upper   = false
  numeric  = true
}

# Erstelle eine lokale Datei mit dem zufälligen String im Filenamen
resource "local_file" "example_file" {
  filename = "${random_string.random.result}_file.txt"
  content  = "This is a file with a random filename."
}

# Output, um den Namen der erstellten Datei anzuzeigen
output "filename" {
  value = local_file.example_file.filename
}
