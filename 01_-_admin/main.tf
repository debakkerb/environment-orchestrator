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

locals {
  project_apis = [
    "cloudbuild.googleapis.com",
    "sourcerepos.googleapis.com",
    "artifactregistry.googleapis.com",
    "firebase.googleapis.com",
    "storage.googleapis.com"
  ]
}

data "google_project" "default" {
  project_id = var.admin_project_id
}

resource "google_project_service" "enabled_apis" {
  for_each = toset(local.project_apis)
  project  = data.google_project.default.project_id
  service  = each.value
}

resource "random_id" "default" {
  byte_length = 2
}

resource "google_service_account" "orchestrator" {
  project     = data.google_project.default.project_id
  account_id  = var.firebase_env_orchestrator_id
  description = "Service Account that orchestrates the creation of the different environments."
}

resource "google_service_account" "admin" {
  project     = data.google_project.default.project_id
  account_id  = var.admin_orchestrator_id
  description = "Service Account that orchestrates the creation of the admin resources."
}