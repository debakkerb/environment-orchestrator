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

resource "google_storage_bucket" "terraform_state_bucket" {
  project                     = data.google_project.default.project_id
  location                    = "EU"
  name                        = format("%s-%s", var.terraform_state_bucket_name, random_id.default.hex)
  uniform_bucket_level_access = true
  force_destroy               = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      num_newer_versions = 5
    }
  }

  depends_on = [google_project_service.enabled_apis]
}

resource "google_storage_bucket" "environment_state_bucket" {
  project                     = data.google_project.default.project_id
  location                    = "EU"
  name                        = format("%s-%s", var.environment_state_bucket_name, random_id.default.hex)
  uniform_bucket_level_access = true
  force_destroy               = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      num_newer_versions = 5
    }
  }

  depends_on = [google_project_service.enabled_apis]
}