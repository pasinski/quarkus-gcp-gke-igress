resource "google_spanner_instance" "main" {
  name         = "quarkus-quickstart-spanner"  # << be careful changing this in production
  config       = "regional-${var.region}"
  display_name = "quarkus-quickstart"
  num_nodes    = 1
  labels = {
    "env" = "stg"
  }
}

resource "google_spanner_database" "database" {
  instance = google_spanner_instance.main.name
  name     = "quarkus-quickstart-sample-db"

  deletion_protection = false
}