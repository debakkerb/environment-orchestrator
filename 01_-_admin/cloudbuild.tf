/**
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

resource "google_cloudbuild_trigger" "admin_trigger" {
  project         = data.google_project.default.project_id
  description     = "Cloud Build trigger to manage the Admin project and all it's dependent resources."
  service_account = google_service_account.admin.id

  trigger_template {
    branch_name = "^main$"
    repo_name   = google_sourcerepo_repository.git_repo.name
  }

  included_files = ["01-_-admin/**"]

  filename = "01_-_admin/cloudbuild.yaml"
}