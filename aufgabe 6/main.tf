provider "archive" {
  
}
resource "archive_file" "data_zip" {
  type        = "zip"
  source_dir  = "${path.module}/data/files"
  output_path = "${path.module}/data.zip"
}

output "zip_path" {
  value = archive_file.data_zip.output_path
}
