# Bucket to store website
resource "google_storage_bucket" "winter_boot_website" {
  name = "winter-boot-bucket"
  location     = "US"
}

# Make new objects public
resource "google_storage_bucket_access_control" "public_rule" {
  object = google_storage_bucket_object.static_site_source.name
  bucket = google_storage_bucket.winter_boot_website.name
  role = "READER"
  entity = "allUsers"
}

# Upload html file to bucket
resource "google_storage_bucket_object" "static_site_source" {
  name     = "index.html"
  source   = "../website/index.html"
  bucket   = "google_storage_bucket.winter_boot_website.name"
}