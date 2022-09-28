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

resource "google_sourcerepo_repository" "git_repo" {
  project = data.google_project.default.project_id
  name    = var.source_repo_name
}

resource "google_sourcerepo_repository_iam_member" "cloud_build_access" {
  for_each = toset([
    google_service_account.admin.email,
    google_service_account.orchestrator.email
  ])

  project    = data.google_project.default.project_id
  member     = "serviceAccount:${each.value}"
  repository = google_sourcerepo_repository.git_repo.name
  role       = "roles/source.writer"
}