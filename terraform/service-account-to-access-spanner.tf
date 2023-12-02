resource "google_service_account" "spanner_service_account" {
  account_id   = "quickstart-accessspanner"
  display_name = "Service Account to access spanner database"
}


resource "google_spanner_database_iam_member" "add-qs-sa-to-db" {
  instance = google_spanner_instance.main.name
  database = google_spanner_database.database.name
  role = "roles/spanner.databaseUser"
  member = "serviceAccount:${google_service_account.spanner_service_account.email}"
}

resource "google_service_account_iam_member" "allow_gke_to_use_service" {
  service_account_id = google_service_account.spanner_service_account.id
  role = "roles/iam.workloadIdentityUser"
  member = "serviceAccount:${var.project_id}.svc.id.goog[default/quarkus-qs-kube-sa]"
}