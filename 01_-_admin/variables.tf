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

variable "admin_orchestrator_id" {
  description = "ID of the service account that will orchestrate the resources inside the admin project."
  type        = string
  default     = "admin-orchestrator"
}

variable "admin_project_id" {
  description = "Existing project ID where the admin resources are stored."
  type        = string
}

variable "builder_registry_id" {
  description = "ID of the Artifact Registry where the Cloud Build images will be stored."
  type        = string
  default     = "cloud-build-registry"
}

variable "firebase_env_orchestrator_id" {
  description = "ID of the service account that will create the Firebase environments."
  type        = string
  default     = "env-orchestrator"
}

variable "firebase_image_name" {
  description = "Name of the Firebase Image, stored in Artifact Registry."
  type        = string
  default     = "fb-builder"
}

variable "region" {
  description = "Default region for all resources."
  type        = string
  default     = "europe-west1"
}

variable "terraform_checksum" {
  description = "Checksum of the Terraform binary."
  type        = string
  default     = "380ca822883176af928c80e5771d1c0ac9d69b13c6d746e6202482aedde7d457"
}

variable "terraform_image_name" {
  description = "Image name in Artifact Registry for the Terraform image."
  type        = string
  default     = "tf-builder"
}

variable "terraform_state_bucket_name" {
  description = "Name of the storage bucket where the Terraform resources will be stored."
  type        = string
  default     = "tf-state-storage"
}

variable "terraform_version" {
  description = "What version of Terraform you want to use."
  type        = string
  default     = "1.3.0"
}

variable "zone" {
  description = "Default zone for all resources."
  type        = string
  default     = "europe-west1-b"
}