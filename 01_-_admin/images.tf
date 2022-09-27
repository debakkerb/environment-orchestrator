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

resource "google_artifact_registry_repository" "builder_images_registry" {
  project       = data.google_project.default.project_id
  format        = "DOCKER"
  repository_id = var.builder_registry_id
  location      = var.region
}

module "terraform_builder" {
  source = "../00_-_modules/terraform_builder"

  project_id         = data.google_project.default.project_id
  terraform_checksum = var.terraform_checksum
  terraform_version  = var.terraform_version
  image_name         = "${var.region}-docker.pkg.dev/${data.google_project.default.project_id}/${google_artifact_registry_repository.builder_images_registry.name}/${var.terraform_image_name}"
}

module "firebase_builder" {
  source = "../00_-_modules/firebase_builder"

  project_id = data.google_project.default.project_id
  image_name = "${var.region}-docker.pkg.dev/${data.google_project.default.project_id}/${google_artifact_registry_repository.builder_images_registry.name}/${var.firebase_image_name}"
}
